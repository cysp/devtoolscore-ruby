#ifndef DEVTOOLSCORE_PBXGROUP_H
#define DEVTOOLSCORE_PBXGROUP_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXGroup;
#else
# define PBXGroup void
#endif


extern void dtc_pbxgroup_define(void);

extern VALUE dtc_pbxgroup_new(PBXGroup *group, VALUE parent_value);
extern PBXGroup *dtc_pbxgroup_pbxobject(VALUE object);

#endif
