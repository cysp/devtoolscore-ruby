#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxbuildfile.h"


VALUE dtc_pbxbuildfile_new(PBXBuildFile *buildFile, VALUE buildphase_value) {
    VALUE self = dtc_pbxbuildfile_alloc(dtc_rbcPBXBuildFile);
    self = dtc_pbxbuildfile_initialize(self, buildFile, buildphase_value);
    return self;
}


VALUE dtc_pbxbuildfile_alloc(VALUE klass) {
    struct dtc_rbcPBXBuildFile_s *s = NULL;
	VALUE self = Data_Make_Struct(dtc_rbcPBXBuildFile, struct dtc_rbcPBXBuildFile_s, dtc_pbxbuildfile_mark, dtc_pbxbuildfile_dealloc, s);
    return self;
}

VALUE dtc_pbxbuildfile_initialize(VALUE self, PBXBuildFile *buildFile, VALUE buildphase_value) {
    self = dtc_pbxobject_initialize(self, buildFile);

	struct dtc_rbcPBXBuildFile_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXBuildFile_s, s);
	if (!s) {
		return Qnil;
	}

	s->buildphase = buildphase_value;

	@autoreleasepool {
		NSString *buildfile_name = buildFile.name;
		if (buildfile_name) {
			VALUE buildfile_name_value = rb_str_new_cstr(buildfile_name.UTF8String);
			rb_ivar_set(self, rb_intern("@name"), buildfile_name_value);
		}

		NSString *buildfile_path = buildFile.path;
		if (buildfile_path) {
			VALUE buildfile_path_value = rb_str_new_cstr(buildfile_path.UTF8String);
			rb_ivar_set(self, rb_intern("@path"), buildfile_path_value);
		}
	}

	return self;
}

void dtc_pbxbuildfile_mark(struct dtc_rbcPBXBuildFile_s *s) {
    dtc_pbxobject_mark((struct dtc_rbcPBXObject_s *)s);

	if (s->buildphase) {
		rb_gc_mark(s->buildphase);
	}
	if (s->absolute_path_value) {
		rb_gc_mark(s->absolute_path_value);
	}
}

void dtc_pbxbuildfile_dealloc(struct dtc_rbcPBXBuildFile_s *s) {
    dtc_pbxobject_dealloc((struct dtc_rbcPBXObject_s *)s);
}


PBXBuildFile *dtc_pbxbuildfile_pbxobject(VALUE object) {
	struct dtc_rbcPBXBuildFile_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXBuildFile_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXBuildFile *)DTC_PBXOBJECT(s)->object;
}

static VALUE pbxbuildfile_absolute_path(VALUE self) {
	struct dtc_rbcPBXBuildFile_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXBuildFile_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXBuildFile * const bf = (__bridge PBXBuildFile *)DTC_PBXOBJECT(s)->object;
		if (!bf) {
			rb_raise(rb_eArgError, "buildfile is nil?");
			return Qnil;
		}

		VALUE absolute_path_value = s->absolute_path_value;
		if (absolute_path_value) {
			return absolute_path_value;
		}

		absolute_path_value = Qnil;

		NSString *buildFileAbsolutePath = bf.absolutePath;
		if (buildFileAbsolutePath) {
			absolute_path_value = rb_str_new_cstr(buildFileAbsolutePath.UTF8String);
		}

		s->absolute_path_value = absolute_path_value;

		return absolute_path_value;
	}
}

void dtc_pbxbuildfile_define(void) {
	if (!dtc_cPBXBuildFile) {
		rb_raise(rb_eLoadError, "Could not find class PBXBuildFile");
		return;
	}

	dtc_rbcPBXBuildFile = rb_define_class_under(dtc_rbmDevToolsCore, "PBXBuildFile", dtc_rbcPBXProjectItem);
	rb_define_alloc_func(dtc_rbcPBXBuildFile, dtc_alloc_raise);
	rb_define_attr(dtc_rbcPBXBuildFile, "name", 1, 0);
	rb_define_attr(dtc_rbcPBXBuildFile, "path", 1, 0);
	rb_define_method(dtc_rbcPBXBuildFile, "absolute_path", pbxbuildfile_absolute_path, 0);
}
