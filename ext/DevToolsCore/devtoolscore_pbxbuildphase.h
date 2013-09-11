#ifndef DEVTOOLSCORE_PBXBUILDPHASE_H
#define DEVTOOLSCORE_PBXBUILDPHASE_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXBuildPhase;
#else
# define PBXBuildPhase void
#endif

extern void dtc_pbxbuildphase_define(void);

extern VALUE dtc_pbxbuildphase_new(PBXBuildPhase *buildPhase, VALUE target_value);
extern PBXBuildPhase *dtc_pbxbuildphase_pbxobject(VALUE object);

#endif
