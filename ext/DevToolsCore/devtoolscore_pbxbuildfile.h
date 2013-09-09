#ifndef DEVTOOLSCORE_PBXBUILDFILE_H
#define DEVTOOLSCORE_PBXBUILDFILE_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXBuildFile;
#else
# define PBXBuildFile void
#endif


extern VALUE rb_cPBXBuildFile;
extern void devtoolscore_pbxbuildfile_define(void);

extern VALUE devtoolscore_pbxbuildfile_new(VALUE target_value, PBXBuildFile *buildFile);

#endif
