#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxbuildphase.h"
#include "devtoolscore_pbxbuildfile.h"


static Class cPBXBuildPhase = NULL;

VALUE rb_cPBXBuildPhase = 0;
VALUE rb_cPBXAppleScriptBuildPhase = 0;
VALUE rb_cPBXCopyFilesBuildPhase = 0;
VALUE rb_cPBXFrameworksBuildPhase = 0;
VALUE rb_cPBXHeadersBuildPhase = 0;
VALUE rb_cPBXJavaArchiveBuildPhase = 0;
VALUE rb_cPBXResourcesBuildPhase = 0;
VALUE rb_cPBXRezBuildPhase = 0;
VALUE rb_cPBXShellScriptBuildPhase = 0;
VALUE rb_cPBXSourcesBuildPhase = 0;
struct rb_PBXBuildPhase_s {
	VALUE target;
	CFTypeRef buildphase;
	VALUE build_files_value;
};


//static VALUE pbxbuildphase_initialize(VALUE self, VALUE target_value, VALUE name_value);
static void pbxbuildphase_mark(VALUE self);
static void pbxbuildphase_dealloc(VALUE self);

static VALUE pbxbuildphase_klass_for_buildphase(PBXBuildPhase *buildPhase) {
	static Class PBXAppleScriptBuildPhaseClass = nil;
	static Class PBXCopyFilesBuildPhaseClass = nil;
	static Class PBXFrameworksBuildPhaseClass = nil;
	static Class PBXHeadersBuildPhaseClass = nil;
	static Class PBXJavaArchiveBuildPhaseClass = nil;
	static Class PBXResourcesBuildPhaseClass = nil;
	static Class PBXRezBuildPhaseClass = nil;
	static Class PBXShellScriptBuildPhaseClass = nil;
	static Class PBXSourcesBuildPhaseClass = nil;

	static dispatch_once_t once;
	dispatch_once(&once, ^{
		PBXAppleScriptBuildPhaseClass = NSClassFromString(@"PBXAppleScriptBuildPhase");
		PBXCopyFilesBuildPhaseClass = NSClassFromString(@"PBXCopyFilesBuildPhase");
		PBXFrameworksBuildPhaseClass = NSClassFromString(@"PBXFrameworksBuildPhase");
		PBXHeadersBuildPhaseClass = NSClassFromString(@"PBXHeadersBuildPhase");
		PBXJavaArchiveBuildPhaseClass = NSClassFromString(@"PBXJavaArchiveBuildPhase");
		PBXResourcesBuildPhaseClass = NSClassFromString(@"PBXResourcesBuildPhase");
		PBXRezBuildPhaseClass = NSClassFromString(@"PBXRezBuildPhase");
		PBXShellScriptBuildPhaseClass = NSClassFromString(@"PBXShellScriptBuildPhase");
		PBXSourcesBuildPhaseClass = NSClassFromString(@"PBXSourcesBuildPhase");
	});

	Class const buildPhaseClass = [buildPhase class];
	if (buildPhaseClass == PBXAppleScriptBuildPhaseClass) return rb_cPBXAppleScriptBuildPhase;
	if (buildPhaseClass == PBXCopyFilesBuildPhaseClass) return rb_cPBXCopyFilesBuildPhase;
	if (buildPhaseClass == PBXFrameworksBuildPhaseClass) return rb_cPBXFrameworksBuildPhase;
	if (buildPhaseClass == PBXHeadersBuildPhaseClass) return rb_cPBXHeadersBuildPhase;
	if (buildPhaseClass == PBXJavaArchiveBuildPhaseClass) return rb_cPBXJavaArchiveBuildPhase;
	if (buildPhaseClass == PBXResourcesBuildPhaseClass) return rb_cPBXResourcesBuildPhase;
	if (buildPhaseClass == PBXRezBuildPhaseClass) return rb_cPBXRezBuildPhase;
	if (buildPhaseClass == PBXShellScriptBuildPhaseClass) return rb_cPBXShellScriptBuildPhase;
	if (buildPhaseClass == PBXSourcesBuildPhaseClass) return rb_cPBXSourcesBuildPhase;
	return rb_cPBXBuildPhase;
}

VALUE devtoolscore_pbxbuildphase_new(VALUE target_value, PBXBuildPhase *buildphase) {
	struct rb_PBXBuildPhase_s *s = NULL;
	VALUE klass = pbxbuildphase_klass_for_buildphase(buildphase);
	VALUE buildphase_value = Data_Make_Struct(klass, struct rb_PBXBuildPhase_s, pbxbuildphase_mark, pbxbuildphase_dealloc, s);
	s->target = target_value;

	@autoreleasepool {
		s->buildphase = (__bridge_retained CFTypeRef)buildphase;
	}

	return buildphase_value;
}

static void pbxbuildphase_mark(VALUE self) {
	struct rb_PBXBuildPhase_s *s = (struct rb_PBXBuildPhase_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	if (s->target) {
		rb_gc_mark(s->target);
	}
	if (s->build_files_value) {
		rb_gc_mark(s->build_files_value);
	}
}

static void pbxbuildphase_dealloc(VALUE self) {
	struct rb_PBXBuildPhase_s *s = (struct rb_PBXBuildPhase_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	@autoreleasepool {
		CFTypeRef buildphase = s->buildphase;
		if (buildphase) {
			CFRelease(buildphase);
		}
	}
}

static VALUE pbxbuildphase_build_files(VALUE self) {
	struct rb_PBXBuildPhase_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXBuildPhase_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXBuildPhase * const bp = (__bridge PBXBuildPhase *)s->buildphase;
		if (!bp) {
			rb_raise(rb_eArgError, "buildphase is nil?");
			return Qnil;
		}

		VALUE build_files_value = s->build_files_value;
		if (build_files_value) {
			return build_files_value;
		}

		NSArray * const buildFiles = bp.buildFiles;
		build_files_value = rb_ary_new2(buildFiles.count);
		for (PBXBuildFile *buildFile in buildFiles) {
			VALUE const buildfile_value = devtoolscore_pbxbuildfile_new(self, buildFile);
			if (buildfile_value) {
				rb_ary_push(build_files_value, buildfile_value);
			}
		}

		s->build_files_value = build_files_value;

		return build_files_value;
	}
}


void devtoolscore_pbxbuildphase_define(void) {
	cPBXBuildPhase = NSClassFromString(@"PBXBuildPhase");
	if (!cPBXBuildPhase) {
		rb_raise(rb_eLoadError, "Could not find class PBXBuildPhase");
		return;
	}

	rb_cPBXBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXBuildPhase", rb_cObject);
	rb_cPBXAppleScriptBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXAppleScriptBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXCopyFilesBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXCopyFilesBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXFrameworksBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXFrameworksBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXHeadersBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXHeadersBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXJavaArchiveBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXJavaArchiveBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXResourcesBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXResourcesBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXRezBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXRezBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXShellScriptBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXShellScriptBuildPhase", rb_cPBXBuildPhase);
	rb_cPBXSourcesBuildPhase = rb_define_class_under(rb_mDevToolsCore, "PBXSourcesBuildPhase", rb_cPBXBuildPhase);
	rb_define_alloc_func(rb_cPBXBuildPhase, devtoolscore_alloc_raise);
	rb_define_method(rb_cPBXBuildPhase, "build_files", pbxbuildphase_build_files, 0);
}
