#ifndef DEVTOOLSCORE_PBXBUILDPHASE_H
#define DEVTOOLSCORE_PBXBUILDPHASE_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXBuildPhase;
#else
# define PBXBuildPhase void
#endif


extern VALUE rb_cPBXBuildPhase;
extern VALUE rb_cPBXAppleScriptBuildPhase;
extern VALUE rb_cPBXCopyFilesBuildPhase;
extern VALUE rb_cPBXFrameworksBuildPhase;
extern VALUE rb_cPBXHeadersBuildPhase;
extern VALUE rb_cPBXJavaArchiveBuildPhase;
extern VALUE rb_cPBXResourcesBuildPhase;
extern VALUE rb_cPBXRezBuildPhase;
extern VALUE rb_cPBXShellScriptBuildPhase;
extern VALUE rb_cPBXSourcesBuildPhase;
extern void devtoolscore_pbxbuildphase_define(void);

extern VALUE devtoolscore_pbxbuildphase_new(VALUE target_value, PBXBuildPhase *buildPhase);

#endif
