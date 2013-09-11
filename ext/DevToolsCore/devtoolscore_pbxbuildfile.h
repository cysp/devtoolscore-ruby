#ifndef DEVTOOLSCORE_PBXBUILDFILE_H
#define DEVTOOLSCORE_PBXBUILDFILE_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXBuildFile;
#else
# define PBXBuildFile void
#endif


extern void dtc_pbxbuildfile_define(void);

extern VALUE dtc_pbxbuildfile_new(PBXBuildFile *buildFile, VALUE parent_value);
extern PBXBuildFile *dtc_pbxbuildfile_pbxobject(VALUE object);

#endif
