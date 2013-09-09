#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxtarget.h"
#include "devtoolscore_pbxbuildphase.h"


static Class cPBXTarget = NULL;

VALUE rb_cPBXTarget = 0;
struct rb_PBXTarget_s {
	VALUE project;
	CFTypeRef target;
	VALUE build_phases_value;
};


//static VALUE pbxtarget_initialize(VALUE self, VALUE project_value, VALUE name_value);
static void pbxtarget_mark(VALUE self);
static void pbxtarget_dealloc(VALUE self);

VALUE devtoolscore_pbxtarget_new(VALUE project_value, PBXTarget *target) {
	struct rb_PBXTarget_s *s = NULL;
	VALUE target_value = Data_Make_Struct(rb_cPBXTarget, struct rb_PBXTarget_s, pbxtarget_mark, pbxtarget_dealloc, s);
	s->project = project_value;

	@autoreleasepool {
		s->target = (__bridge_retained CFTypeRef)target;

		NSString *target_name = target.name;
		if (target_name) {
			VALUE target_name_value = rb_str_new_cstr(target_name.UTF8String);
			rb_ivar_set(target_value, rb_intern("@name"), target_name_value);
		}
	}

	return target_value;
}

static void pbxtarget_mark(VALUE self) {
	struct rb_PBXTarget_s *s = (struct rb_PBXTarget_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	if (s->project) {
		rb_gc_mark(s->project);
	}
	if (s->build_phases_value) {
		rb_gc_mark(s->build_phases_value);
	}
}

static void pbxtarget_dealloc(VALUE self) {
	struct rb_PBXTarget_s *s = (struct rb_PBXTarget_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	@autoreleasepool {
		CFTypeRef target = s->target;
		if (target) {
			CFRelease(target);
		}
	}
}


static VALUE pbxtarget_name_set(VALUE self, VALUE name_value) {
	Check_Type(name_value, T_STRING);

	struct rb_PBXTarget_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXTarget_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXTarget *target = (__bridge PBXTarget *)s->target;
		if (!target) {
			rb_raise(rb_eArgError, "target is nil?");
			return Qnil;
		}

		NSString * const name = [[NSString alloc] initWithUTF8String:RSTRING_PTR(name_value)];
		target.name = name;

		return name_value;
	}
}

static VALUE pbxtarget_expanded_value_for_string(int argc, VALUE *argv, VALUE self) {
	struct rb_PBXTarget_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXTarget_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	if (argc < 1 || argc > 2) {
		rb_raise(rb_eArgError, "wrong number of arguments");
		return Qnil;
	}

	VALUE string_value = argv[0];
	VALUE configuration_name_value = 0;
	if (argc > 1) {
		configuration_name_value = argv[1];
	}
	if (configuration_name_value == 0) {
		configuration_name_value = rb_funcall(s->project, rb_intern("active_build_configuration_name"), 0);
	}

	@autoreleasepool {
		PBXTarget *target = (__bridge PBXTarget *)s->target;
		if (!target) {
			rb_raise(rb_eArgError, "target is nil?");
			return Qnil;
		}

		NSString * const string = [[NSString alloc] initWithUTF8String:RSTRING_PTR(string_value)];
		NSString * const configurationName = [[NSString alloc] initWithUTF8String:RSTRING_PTR(configuration_name_value)];
		NSString * const expandedValue = [target expandedValueForString:string forConfigurationNamed:configurationName];

		VALUE const expanded_value_value = rb_str_new_cstr(expandedValue.UTF8String);
		return expanded_value_value;
	}
}

static VALUE pbxtarget_build_phases(VALUE self) {
	struct rb_PBXTarget_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXTarget_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXTarget * const t = (__bridge PBXTarget *)s->target;
		if (!t) {
			rb_raise(rb_eArgError, "target is nil?");
			return Qnil;
		}

		VALUE build_phases_value = s->build_phases_value;
		if (build_phases_value) {
			return build_phases_value;
		}

		NSArray * const buildPhases = t.buildPhases;
		build_phases_value = rb_ary_new2(buildPhases.count);
		for (PBXBuildPhase *buildPhase in buildPhases) {
			VALUE const buildphase_value = devtoolscore_pbxbuildphase_new(self, buildPhase);
			if (buildphase_value) {
				rb_ary_push(build_phases_value, buildphase_value);
			}
		}

		s->build_phases_value = build_phases_value;

		return build_phases_value;
	}
}



void devtoolscore_pbxtarget_define(void) {
	cPBXTarget = NSClassFromString(@"PBXTarget");
	if (!cPBXTarget) {
		rb_raise(rb_eLoadError, "Could not find class PBXTarget");
		return;
	}

	rb_cPBXTarget = rb_define_class_under(rb_mDevToolsCore, "PBXTarget", rb_cObject);
	rb_define_alloc_func(rb_cPBXTarget, devtoolscore_alloc_raise);
	rb_define_attr(rb_cPBXTarget, "name", 1, 0);
	rb_define_method(rb_cPBXTarget, "name=", pbxtarget_name_set, 1);
	rb_define_method(rb_cPBXTarget, "expanded_value_for_string", pbxtarget_expanded_value_for_string, -1);
	rb_define_method(rb_cPBXTarget, "build_phases", pbxtarget_build_phases, 0);
}
