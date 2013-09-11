#ifndef DEVTOOLSCORE_PBXTARGET_H
#define DEVTOOLSCORE_PBXTARGET_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXTarget;
#else
# define PBXTarget void
#endif


extern void dtc_pbxtarget_define(void);

extern VALUE dtc_pbxtarget_new(PBXTarget *target, VALUE project_value);
extern PBXTarget *dtc_pbxtarget_pbxobject(VALUE object);

#endif
