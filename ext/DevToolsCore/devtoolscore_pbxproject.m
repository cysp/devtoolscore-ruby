#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxproject.h"
#include "devtoolscore_pbxgroup.h"
#include "devtoolscore_pbxtarget.h"


static VALUE pbxproject_open(int argc, VALUE *argv, VALUE self) {
	if (self != dtc_rbcPBXProject) {
		rb_raise(rb_eArgError, "");
	}

    if (argc < 1 || argc > 2) {
		rb_raise(rb_eArgError, "incorrect number of arguments");
		return Qnil;
	}

    VALUE project_path_value = StringValue(argv[0]);

    VALUE options_value = Qnil;
    if (argc > 1) {
        options_value = argv[1];
    }

    if (options_value != Qnil) {
        Check_Type(options_value, T_HASH);
    }

    VALUE options_readonly_value = Qnil;
    if (options_value != Qnil) {
        if (options_readonly_value == Qnil) {
            VALUE const readonly_sym_value = ID2SYM(rb_intern("readonly"));
            options_readonly_value = rb_hash_lookup2(options_value, readonly_sym_value, Qfalse);
        }
        if (options_readonly_value == Qnil) {
            VALUE const readonly_str_value = rb_str_new_cstr("readonly");
            options_readonly_value = rb_hash_lookup2(options_value, readonly_str_value, Qfalse);
        }
    }
    BOOL const readonly = RTEST(options_readonly_value);

	@autoreleasepool {
		NSString * const path = [[NSString alloc] initWithUTF8String:RSTRING_PTR(project_path_value)];
		PBXProject * const project = [dtc_cPBXProject projectWithFile:path errorHandler:nil readOnly:readonly];
		if (!project) {
			return Qnil;
		}

        VALUE project_value = dtc_pbxproject_alloc(dtc_rbcPBXProject);
        project_value = dtc_pbxproject_initialize(project_value, project);

        return project_value;
    }
}


VALUE dtc_pbxproject_alloc(VALUE klass) {
	struct dtc_rbcPBXProject_s *s = NULL;
	VALUE project_value = Data_Make_Struct(dtc_rbcPBXProject, struct dtc_rbcPBXProject_s, dtc_pbxproject_mark, dtc_pbxproject_dealloc, s);
	return project_value;
}

VALUE dtc_pbxproject_initialize(VALUE self, PBXProject *project) {
    self = dtc_pbxobject_initialize(self, project);

	struct dtc_rbcPBXProject_s *s = NULL;
    Data_Get_Struct(self, struct dtc_rbcPBXProject_s, s);
   	if (!s) {
   	    return Qnil;
    }

    @autoreleasepool {
		NSString * const project_name = project.name;
		if (project_name) {
			VALUE const project_name_value = rb_str_new_cstr(project_name.UTF8String);
			rb_ivar_set(self, rb_intern("@name"), project_name_value);
		}

		NSString * const project_path = project.path;
		if (project_path) {
			VALUE const project_path_value = rb_str_new_cstr(project_path.UTF8String);
			rb_ivar_set(self, rb_intern("@path"), project_path_value);
		}

		return self;
	}
}


void dtc_pbxproject_dealloc(VALUE self) {
	struct dtc_rbcPBXProject_s * const s = (struct dtc_rbcPBXProject_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    dtc_pbxobject_dealloc((struct dtc_rbcPBXObject_s *)s);
}

void dtc_pbxproject_mark(VALUE self) {
	struct dtc_rbcPBXProject_s *s = (struct dtc_rbcPBXProject_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    dtc_pbxobject_mark((struct dtc_rbcPBXObject_s *)s);

	if (s->root_group_value) {
		rb_gc_mark(s->root_group_value);
	}
	if (s->targets_value) {
		rb_gc_mark(s->targets_value);
	}
}


PBXProject *dtc_pbxproject_pbxobject(VALUE object) {
	struct dtc_rbcPBXProject_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXProject_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXProject *)DTC_PBXOBJECT(s)->object;
}


static VALUE pbxproject_children(VALUE self) {
    struct dtc_rbcPBXProject_s *s = NULL;
    Data_Get_Struct(self, struct dtc_rbcPBXProject_s, s);
    if (!s) {
        rb_raise(rb_eArgError, "self is NULL?");
        return Qnil;
    }

    @autoreleasepool {
        PBXProject * const g = (__bridge PBXProject *)DTC_PBXOBJECT(s)->object;
        if (!g) {
            rb_raise(rb_eArgError, "group is nil?");
            return Qnil;
        }

        VALUE children_value = s->children_value;
        if (children_value) {
            return children_value;
        }

        NSArray * const children = g.children;
        children_value = rb_ary_new2(children.count);
        for (PBXObject *child in children) {
            VALUE const child_value = dtc_pbxsomething_new(child, self) ?: Qnil;
            rb_ary_push(children_value, child_value);
        }
        
        s->children_value = children_value;
        
        return children_value;
    }
}

static VALUE pbxproject_root_group(VALUE self) {
	struct dtc_rbcPBXProject_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)DTC_PBXOBJECT(s)->object;
		if (!p) {
			rb_raise(rb_eArgError, "project is nil?");
			return Qnil;
		}

		VALUE root_group_value = s->root_group_value;
		if (root_group_value) {
			return root_group_value;
		}

		PBXGroup * const rootGroup = p.rootGroup;
		root_group_value = dtc_pbxgroup_new(rootGroup, self);

		s->root_group_value = root_group_value;

		return root_group_value;
	}
}


static VALUE pbxproject_targets(VALUE self) {
	struct dtc_rbcPBXProject_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)DTC_PBXOBJECT(s)->object;
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
			VALUE const target_value = dtc_pbxtarget_new(target, self);
			if (target_value) {
				rb_ary_push(targets_value, target_value);
			}
		}

		s->targets_value = targets_value;

		return targets_value;
	}
}

static VALUE pbxproject_active_build_configuration_name(VALUE self) {
	struct dtc_rbcPBXProject_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)DTC_PBXOBJECT(s)->object;
		if (!p) {
			rb_raise(rb_eArgError, "project is nil?");
			return Qnil;
		}

		NSString * const activeBuildConfigurationName = p.activeBuildConfigurationName;
		return rb_str_new_cstr(activeBuildConfigurationName.UTF8String);
	}
}

static VALUE pbxproject_available_build_configuration_names(VALUE self) {
	struct dtc_rbcPBXProject_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)DTC_PBXOBJECT(s)->object;
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
	struct dtc_rbcPBXProject_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXProject_s, s);
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
		path_value = StringValue(argv[0]);
	}

	@autoreleasepool {
		PBXProject * const p = (__bridge PBXProject *)DTC_PBXOBJECT(s)->object;
		if (!p) {
			return Qfalse;
		}
        if ([p isReadOnly]) {
            return Qfalse;
        }

        NSString *path = path_value ? [[NSString alloc] initWithBytes:RSTRING_PTR(path_value) length:RSTRING_LEN(path_value) encoding:NSUTF8StringEncoding] : nil;
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


void dtc_pbxproject_define(void) {
	if (!dtc_cPBXProject) {
		rb_raise(rb_eLoadError, "Could not find class PBXProject");
		return;
	}

	dtc_rbcPBXProject = rb_define_class_under(dtc_rbmDevToolsCore, "PBXProject", dtc_rbcPBXContainer);
	rb_define_alloc_func(dtc_rbcPBXProject, dtc_alloc_raise);
	rb_define_singleton_method(dtc_rbcPBXProject, "open", pbxproject_open, -1);
	rb_define_attr(dtc_rbcPBXProject, "name", 1, 0);
	rb_define_attr(dtc_rbcPBXProject, "path", 1, 0);
    rb_define_method(dtc_rbcPBXProject, "children", pbxproject_children, 0);
	rb_define_method(dtc_rbcPBXProject, "root_group", pbxproject_root_group, 0);
	rb_define_method(dtc_rbcPBXProject, "targets", pbxproject_targets, 0);
	rb_define_method(dtc_rbcPBXProject, "active_build_configuration_name", pbxproject_active_build_configuration_name, 0);
	rb_define_method(dtc_rbcPBXProject, "available_build_configuration_names", pbxproject_available_build_configuration_names, 0);
	rb_define_method(dtc_rbcPBXProject, "write", pbxproject_write, -1);
}
