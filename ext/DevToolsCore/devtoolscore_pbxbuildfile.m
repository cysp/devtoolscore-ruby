#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxbuildfile.h"


static Class cPBXBuildFile = NULL;

VALUE rb_cPBXBuildFile = 0;
struct rb_PBXBuildFile_s {
	VALUE buildphase;
	CFTypeRef buildfile;
	VALUE absolute_path_value;
};


//static VALUE pbxbuildfile_initialize(VALUE self, VALUE buildphase_value, VALUE name_value);
static void pbxbuildfile_mark(VALUE self);
static void pbxbuildfile_dealloc(VALUE self);

VALUE devtoolscore_pbxbuildfile_new(VALUE buildphase_value, PBXBuildFile *buildFile) {
	struct rb_PBXBuildFile_s *s = NULL;
	VALUE buildfile_value = Data_Make_Struct(rb_cPBXBuildFile, struct rb_PBXBuildFile_s, pbxbuildfile_mark, pbxbuildfile_dealloc, s);
	s->buildphase = buildphase_value;

	@autoreleasepool {
		s->buildfile = (__bridge_retained CFTypeRef)buildFile;

		NSString *buildfile_name = buildFile.name;
		if (buildfile_name) {
			VALUE buildfile_name_value = rb_str_new_cstr(buildfile_name.UTF8String);
			rb_ivar_set(buildfile_value, rb_intern("@name"), buildfile_name_value);
		}

		NSString *buildfile_path = buildFile.path;
		if (buildfile_path) {
			VALUE buildfile_path_value = rb_str_new_cstr(buildfile_path.UTF8String);
			rb_ivar_set(buildfile_value, rb_intern("@path"), buildfile_path_value);
		}
	}

	return buildfile_value;
}

static void pbxbuildfile_mark(VALUE self) {
	struct rb_PBXBuildFile_s *s = (struct rb_PBXBuildFile_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	if (s->buildphase) {
		rb_gc_mark(s->buildphase);
	}
	if (s->absolute_path_value) {
		rb_gc_mark(s->absolute_path_value);
	}
}

static void pbxbuildfile_dealloc(VALUE self) {
	struct rb_PBXBuildFile_s *s = (struct rb_PBXBuildFile_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	@autoreleasepool {
		CFTypeRef buildfile = s->buildfile;
		if (buildfile) {
			CFRelease(buildfile);
		}
	}
}

static VALUE pbxbuildfile_absolute_path(VALUE self) {
	struct rb_PBXBuildFile_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXBuildFile_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXBuildFile * const bf = (__bridge PBXBuildFile *)s->buildfile;
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

void devtoolscore_pbxbuildfile_define(void) {
	cPBXBuildFile = NSClassFromString(@"PBXBuildFile");
	if (!cPBXBuildFile) {
		rb_raise(rb_eLoadError, "Could not find class PBXBuildFile");
		return;
	}

	rb_cPBXBuildFile = rb_define_class_under(rb_mDevToolsCore, "PBXBuildFile", rb_cObject);
	rb_define_alloc_func(rb_cPBXBuildFile, devtoolscore_alloc_raise);
	rb_define_attr(rb_cPBXBuildFile, "name", 1, 0);
	rb_define_attr(rb_cPBXBuildFile, "path", 1, 0);
	rb_define_method(rb_cPBXBuildFile, "absolute_path", pbxbuildfile_absolute_path, 0);
}
