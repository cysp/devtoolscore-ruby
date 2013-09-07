#ifndef DEVTOOLSCORE_PBXTARGET_H
#define DEVTOOLSCORE_PBXTARGET_H

#include "ruby.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXTarget;
#else
# define PBXTarget void
#endif


extern VALUE rb_cPBXTarget;
extern void devtoolscore_pbxtarget_define(void);

extern VALUE devtoolscore_pbxtarget_new(VALUE project_value, PBXTarget *target);

#endif
