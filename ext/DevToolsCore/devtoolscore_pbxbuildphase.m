#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxobject.h"
#include "devtoolscore_pbxbuildphase.h"
#include "devtoolscore_pbxbuildfile.h"


VALUE dtc_pbxbuildphase_new(PBXBuildPhase *buildphase, VALUE target_value) {
	struct dtc_rbcPBXBuildPhase_s *s = NULL;
	VALUE const klass = dtc_klass_for_pbxobject(buildphase);
	VALUE self = Data_Make_Struct(klass, struct dtc_rbcPBXBuildPhase_s, dtc_pbxbuildphase_mark, dtc_pbxbuildphase_dealloc, s);
    return self;
}


VALUE dtc_pbxbuildphase_initialize(VALUE self, PBXBuildPhase *buildphase, VALUE target_value) {
    self = dtc_pbxobject_initialize(self, buildphase);

    struct dtc_rbcPBXBuildPhase_s *s = NULL;
    Data_Get_Struct(self, struct dtc_rbcPBXBuildPhase_s, s);
    if (!s) {
        return Qnil;
    }

	s->target = target_value;

	return self;
}

void dtc_pbxbuildphase_mark(struct dtc_rbcPBXBuildPhase_s *s) {
    dtc_pbxobject_mark((struct dtc_rbcPBXObject_s *)s);

	if (s->target) {
		rb_gc_mark(s->target);
	}
	if (s->build_files_value) {
		rb_gc_mark(s->build_files_value);
	}
}

void dtc_pbxbuildphase_dealloc(struct dtc_rbcPBXBuildPhase_s *s) {
    dtc_pbxobject_dealloc((struct dtc_rbcPBXObject_s *)s);
}


PBXBuildPhase *dtc_pbxbuildphase_pbxobject(VALUE object) {
	struct dtc_rbcPBXBuildPhase_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXBuildPhase_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXBuildPhase *)DTC_PBXOBJECT(s)->object;
}


static VALUE pbxbuildphase_build_files(VALUE self) {
	struct dtc_rbcPBXBuildPhase_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXBuildPhase_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXBuildPhase * const bp = (__bridge PBXBuildPhase *)DTC_PBXOBJECT(s)->object;
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
			VALUE const buildfile_value = dtc_pbxbuildfile_new(buildFile, self);
			if (buildfile_value) {
				rb_ary_push(build_files_value, buildfile_value);
			}
		}

		s->build_files_value = build_files_value;

		return build_files_value;
	}
}


void dtc_pbxbuildphase_define(void) {
	if (!dtc_cPBXBuildPhase) {
		rb_raise(rb_eLoadError, "Could not find class PBXBuildPhase");
		return;
	}

	dtc_rbcPBXBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXBuildPhase", dtc_rbcPBXProjectItem);
	dtc_rbcPBXAppleScriptBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXAppleScriptBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXCopyFilesBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXCopyFilesBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXFrameworksBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXFrameworksBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXHeadersBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXHeadersBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXJavaArchiveBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXJavaArchiveBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXResourcesBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXResourcesBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXRezBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXRezBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXShellScriptBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXShellScriptBuildPhase", dtc_rbcPBXBuildPhase);
	dtc_rbcPBXSourcesBuildPhase = rb_define_class_under(dtc_rbmDevToolsCore, "PBXSourcesBuildPhase", dtc_rbcPBXBuildPhase);
	rb_define_alloc_func(dtc_rbcPBXBuildPhase, dtc_alloc_raise);
	rb_define_method(dtc_rbcPBXBuildPhase, "build_files", pbxbuildphase_build_files, 0);
}
