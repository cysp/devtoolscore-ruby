#ifndef DEVTOOLSCORE_PBXREFERENCE_H
#define DEVTOOLSCORE_PBXREFERENCE_H

#include "ruby.h"
#include "devtoolscore_pbxobject.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXReference;
#else
# define PBXReference void
#endif


struct dtc_rbcPBXReference_s {
    struct dtc_rbcPBXObject_s super;
	VALUE parent_value;
};


extern void dtc_pbxreference_define(void);

extern VALUE dtc_pbxreference_initialize(VALUE self, PBXReference *reference, VALUE parent_value);
extern void dtc_pbxreference_mark(struct dtc_rbcPBXReference_s *s);
extern void dtc_pbxreference_dealloc(struct dtc_rbcPBXReference_s *s);

#endif
