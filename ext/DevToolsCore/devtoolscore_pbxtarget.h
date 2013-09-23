#ifndef DEVTOOLSCORE_PBXTARGET_H
#define DEVTOOLSCORE_PBXTARGET_H

#include "ruby.h"
#include "devtoolscore_pbxobject.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXTarget;
#else
# define PBXTarget void
#endif


struct dtc_rbcPBXTarget_s {
    struct dtc_rbcPBXObject_s super;
	VALUE project;
	VALUE build_phases_value;
};


extern void dtc_pbxtarget_define(void);

extern VALUE dtc_pbxtarget_new(PBXTarget *target, VALUE project_value);

extern VALUE dtc_pbxtarget_alloc(VALUE klass);
extern VALUE dtc_pbxtarget_initialize(VALUE self, PBXTarget *target, VALUE project_value);
extern void dtc_pbxtarget_mark(struct dtc_rbcPBXTarget_s *s);
extern void dtc_pbxtarget_dealloc(struct dtc_rbcPBXTarget_s *s);

extern PBXTarget *dtc_pbxtarget_pbxobject(VALUE object);

#endif
