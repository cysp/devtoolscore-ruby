#ifndef DEVTOOLSCORE_PBXBUILDPHASE_H
#define DEVTOOLSCORE_PBXBUILDPHASE_H

#include "ruby.h"
#include "devtoolscore_pbxobject.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXBuildPhase;
#else
# define PBXBuildPhase void
#endif


struct dtc_rbcPBXBuildPhase_s {
    struct dtc_rbcPBXObject_s super;
	VALUE target;
	VALUE build_files_value;
};


extern void dtc_pbxbuildphase_define(void);

extern VALUE dtc_pbxbuildphase_new(PBXBuildPhase *buildPhase, VALUE target_value);

extern VALUE dtc_pbxbuildphase_alloc(VALUE klass);
extern VALUE dtc_pbxbuildphase_initialize(VALUE self, PBXBuildPhase *buildPhase, VALUE target_value);
extern void dtc_pbxbuildphase_mark(struct dtc_rbcPBXBuildPhase_s *s);
extern void dtc_pbxbuildphase_dealloc(struct dtc_rbcPBXBuildPhase_s *s);

extern PBXBuildPhase *dtc_pbxbuildphase_pbxobject(VALUE object);

#endif
