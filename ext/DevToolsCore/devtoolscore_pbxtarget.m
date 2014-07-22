#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxobject.h"
#include "devtoolscore_pbxtarget.h"
#include "devtoolscore_pbxbuildphase.h"


VALUE dtc_pbxtarget_new(PBXTarget *target, VALUE project_value) {
    VALUE self = dtc_pbxtarget_alloc(dtc_rbcPBXTarget);
    self = dtc_pbxtarget_initialize(self, target, project_value);
    return self;
}


VALUE dtc_pbxtarget_alloc(VALUE klass) {
	struct dtc_rbcPBXTarget_s *s = NULL;
	VALUE self = Data_Make_Struct(dtc_rbcPBXTarget, struct dtc_rbcPBXTarget_s, dtc_pbxtarget_mark, dtc_pbxtarget_dealloc, s);
	return self;
}

VALUE dtc_pbxtarget_initialize(VALUE self, PBXTarget *target, VALUE project_value) {
    self = dtc_pbxobject_initialize(self, target);
    struct dtc_rbcPBXTarget_s *s = NULL;
    Data_Get_Struct(self, struct dtc_rbcPBXTarget_s, s);
    if (!s) {
        rb_raise(rb_eArgError, "self is NULL?");
        return Qnil;
    }


	s->project = project_value;

	@autoreleasepool {
		NSString *target_name = target.name;
		if (target_name) {
			VALUE target_name_value = rb_str_new_cstr(target_name.UTF8String);
			rb_ivar_set(self, rb_intern("@name"), target_name_value);
		}
	}

	return self;
}

void dtc_pbxtarget_mark(struct dtc_rbcPBXTarget_s *s) {
    dtc_pbxobject_mark((struct dtc_rbcPBXObject_s *)s);

	if (s->project) {
		rb_gc_mark(s->project);
	}
	if (s->build_phases_value) {
		rb_gc_mark(s->build_phases_value);
	}
}

void dtc_pbxtarget_dealloc(struct dtc_rbcPBXTarget_s *s) {
    dtc_pbxobject_dealloc((struct dtc_rbcPBXObject_s *)s);
}


PBXTarget *dtc_pbxtarget_pbxobject(VALUE object) {
	struct dtc_rbcPBXTarget_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXTarget_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXTarget *)DTC_PBXOBJECT(s)->object;
}


static VALUE pbxtarget_name_set(VALUE self, VALUE name_value) {
	Check_Type(name_value, T_STRING);

	struct dtc_rbcPBXTarget_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXTarget_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

    name_value = StringValue(name_value);

	@autoreleasepool {
		PBXTarget * const t = (__bridge PBXTarget *)DTC_PBXOBJECT(s)->object;
		if (!t) {
			rb_raise(rb_eArgError, "target is nil?");
			return Qnil;
		}

        NSString * const name = [[NSString alloc] initWithBytes:RSTRING_PTR(name_value) length:RSTRING_LEN(name_value) encoding:NSUTF8StringEncoding];
		t.name = name;

		NSString *targetName = t.name;
		if (targetName) {
			name_value = rb_str_new_cstr(targetName.UTF8String);
			rb_ivar_set(self, rb_intern("@name"), name_value);
		}

		return name_value;
	}
}

static VALUE pbxtarget_expanded_value_for_string(int argc, VALUE *argv, VALUE self) {
	struct dtc_rbcPBXTarget_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXTarget_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	if (argc < 1 || argc > 2) {
		rb_raise(rb_eArgError, "wrong number of arguments");
		return Qnil;
	}

	VALUE string_value = StringValue(argv[0]);
	VALUE configuration_name_value = 0;
	if (argc > 1) {
		configuration_name_value = StringValue(argv[1]);
	}
	if (configuration_name_value == 0) {
		configuration_name_value = rb_funcall(s->project, rb_intern("active_build_configuration_name"), 0);
	}

	@autoreleasepool {
		PBXTarget * const t = (__bridge PBXTarget *)DTC_PBXOBJECT(s)->object;
		if (!t) {
			rb_raise(rb_eArgError, "target is nil?");
			return Qnil;
		}

        Class klass = NSClassFromString(@"XCShellScriptBuildPhaseDGSnapshot");

//        [t createDependenciesInTargetBuildContextIfNeeded];

//        XCMacroExpansionScope * const scope = [t.targetBuildContext macroExpansionScope];
//        XCShellScriptBuildPhaseDGSnapshot *dgs = [klass environmentWithMacroExpansionScope:scope];
//        NSLog(@"foo: %@", [dgs buildSettings]);
//        [dgs printForDebugging];

        NSString * const string = [[NSString alloc] initWithBytes:RSTRING_PTR(string_value) length:RSTRING_LEN(string_value) encoding:NSUTF8StringEncoding];
        NSString * const configurationName = [[NSString alloc] initWithBytes:RSTRING_PTR(configuration_name_value) length:RSTRING_LEN(configuration_name_value) encoding:NSUTF8StringEncoding];
		NSString * const expandedValue = [t expandedValueForString:string forBuildParameters:nil];
//		NSString * const expandedValue = [t expandedValueForString:string forConfigurationNamed:configurationName];

		VALUE const expanded_value_value = rb_str_new_cstr(expandedValue.UTF8String);
		return expanded_value_value;
	}
}

static VALUE pbxtarget_build_phases(VALUE self) {
	struct dtc_rbcPBXTarget_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXTarget_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXTarget * const t = (__bridge PBXTarget *)DTC_PBXOBJECT(s)->object;
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
			VALUE const buildphase_value = dtc_pbxsomething_new(buildPhase, self) ?: Qnil;
			rb_ary_push(build_phases_value, buildphase_value);
		}

		s->build_phases_value = build_phases_value;

		return build_phases_value;
	}
}



void dtc_pbxtarget_define(void) {
	if (!dtc_cPBXTarget) {
		rb_raise(rb_eLoadError, "Could not find class PBXTarget");
		return;
	}

	dtc_rbcPBXTarget = rb_define_class_under(dtc_rbmDevToolsCore, "PBXTarget", dtc_rbcPBXProjectItem);
	rb_define_alloc_func(dtc_rbcPBXTarget, dtc_alloc_raise);
	rb_define_attr(dtc_rbcPBXTarget, "name", 1, 0);
	rb_define_method(dtc_rbcPBXTarget, "name=", pbxtarget_name_set, 1);
	rb_define_method(dtc_rbcPBXTarget, "expanded_value_for_string", pbxtarget_expanded_value_for_string, -1);
	rb_define_method(dtc_rbcPBXTarget, "build_phases", pbxtarget_build_phases, 0);
}
