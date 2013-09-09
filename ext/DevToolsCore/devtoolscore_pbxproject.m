#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxtarget.h"


static Class cPBXProject = NULL;

VALUE rb_cPBXProject = 0;
struct rb_PBXProject_s {
	CFTypeRef project;
	VALUE targets_value;
};


static VALUE pbxproject_open(VALUE self, VALUE project_path_value);
static void pbxproject_mark(VALUE self);
static void pbxproject_dealloc(VALUE self);

static VALUE pbxproject_open(VALUE self, VALUE project_path_value) {
	if (self != rb_cPBXProject) {
		rb_raise(rb_eArgError, "");
	}

	Check_Type(project_path_value, T_STRING);

	@autoreleasepool {
		NSString * const path = [[NSString alloc] initWithUTF8String:RSTRING_PTR(project_path_value)];
		PBXProject * const project = [cPBXProject projectWithFile:path errorHandler:nil readOnly:NO];
		if (!project) {
			return Qnil;
		}

		struct rb_PBXProject_s *s = NULL;
		VALUE project_value = Data_Make_Struct(rb_cPBXProject, struct rb_PBXProject_s, pbxproject_mark, pbxproject_dealloc, s);
		s->project = (__bridge_retained CFTypeRef)project;

		NSString * const project_name = project.name;
		if (project_name) {
			VALUE const project_name_value = rb_str_new_cstr(project_name.UTF8String);
			rb_ivar_set(project_value, rb_intern("@name"), project_name_value);
		}

		NSString * const project_path = project.path;
		if (project_path) {
			VALUE const project_path_value = rb_str_new_cstr(project_path.UTF8String);
			rb_ivar_set(project_value, rb_intern("@path"), project_path_value);
		}

		return project_value;
	}
}

static void pbxproject_dealloc(VALUE self) {
	struct rb_PBXProject_s * const s = (struct rb_PBXProject_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	@autoreleasepool {
		CFTypeRef p = s->project;
		if (p) {
			CFRelease(p);
		}
	}
}

static void pbxproject_mark(VALUE self) {
	struct rb_PBXProject_s *s = (struct rb_PBXProject_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	if (s->targets_value) {
		rb_gc_mark(s->targets_value);
	}
}


static VALUE pbxproject_targets(VALUE self) {
	struct rb_PBXProject_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)s->project;
		if (!p) {
			rb_raise(rb_eArgError, "project is nil?");
			return Qnil;
		}

		VALUE targets_value = s->targets_value;
		if (targets_value) {
			return targets_value;
		}

		NSArray * const targets = p.targets;
		targets_value = rb_ary_new2(targets.count);
		for (PBXTarget *target in targets) {
			VALUE const target_value = devtoolscore_pbxtarget_new(self, target);
			if (target_value) {
				rb_ary_push(targets_value, target_value);
			}
		}

		s->targets_value = targets_value;

		return targets_value;
	}
}

static VALUE pbxproject_active_build_configuration_name(VALUE self) {
	struct rb_PBXProject_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)s->project;
		if (!p) {
			rb_raise(rb_eArgError, "project is nil?");
			return Qnil;
		}

		NSString * const activeBuildConfigurationName = p.activeBuildConfigurationName;
		return rb_str_new_cstr(activeBuildConfigurationName.UTF8String);
	}
}

static VALUE pbxproject_available_build_configuration_names(VALUE self) {
	struct rb_PBXProject_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)s->project;
		if (!p) {
			rb_raise(rb_eArgError, "project is nil?");
			return Qnil;
		}

		NSArray * const availableBuildConfigurationNames = p.availableBuildConfigurationNames;
		VALUE const available_build_configuration_names_value = rb_ary_new2(availableBuildConfigurationNames.count);
		for (NSString *availableBuildConfigurationName in availableBuildConfigurationNames) {
			rb_ary_push(available_build_configuration_names_value, rb_str_new_cstr(availableBuildConfigurationName.UTF8String));
		}

		return available_build_configuration_names_value;
	}
}


static VALUE pbxproject_write(int argc, VALUE *argv, VALUE self) {
	struct rb_PBXProject_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	if (argc > 1) {
		rb_raise(rb_eArgError, "incorrect number of arguments");
		return Qnil;
	}

	VALUE path_value = 0;
	if (argc == 1) {
		path_value = argv[0];
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)s->project;
		if (!p) {
			return Qfalse;
		}

		NSString *path = path_value ? [[NSString alloc] initWithUTF8String:RSTRING_PTR(path_value)] : nil;
		if (!path) {
			path = p.path;
		}
		if (path) {
			[[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
		}

		BOOL const success = [p writeToFile:path projectFile:YES userFile:NO outResultNotification:NULL];
		return success ? Qtrue : Qfalse;
	}
}


void devtoolscore_pbxproject_define(void) {
	cPBXProject = NSClassFromString(@"PBXProject");
	if (!cPBXProject) {
		rb_raise(rb_eLoadError, "Could not find class PBXProject");
		return;
	}

	rb_cPBXProject = rb_define_class_under(rb_mDevToolsCore, "PBXProject", rb_cObject);
	rb_define_alloc_func(rb_cPBXProject, devtoolscore_alloc_raise);
	rb_define_singleton_method(rb_cPBXProject, "open", pbxproject_open, 1);
	rb_define_attr(rb_cPBXProject, "name", 1, 0);
	rb_define_attr(rb_cPBXProject, "path", 1, 0);
	rb_define_method(rb_cPBXProject, "targets", pbxproject_targets, 0);
	rb_define_method(rb_cPBXProject, "active_build_configuration_name", pbxproject_active_build_configuration_name, 0);
	rb_define_method(rb_cPBXProject, "available_build_configuration_names", pbxproject_available_build_configuration_names, 0);
	rb_define_method(rb_cPBXProject, "write", pbxproject_write, -1);
}
