#ifndef DEVTOOLSCORE_PBXFILEREFERENCE_H
#define DEVTOOLSCORE_PBXFILEREFERENCE_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXFileReference;
#else
# define PBXFileReference void
#endif


extern void dtc_pbxfilereference_define(void);

extern VALUE dtc_pbxfilereference_new(PBXFileReference *filereference, VALUE parent_value);
extern PBXFileReference *dtc_pbxfilereference_pbxobject(VALUE object);

#endif
