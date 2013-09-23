#ifndef DEVTOOLSCORE_PBXFILEREFERENCE_H
#define DEVTOOLSCORE_PBXFILEREFERENCE_H

#include "ruby.h"
#include "devtoolscore_pbxreference.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXFileReference;
#else
# define PBXFileReference void
#endif


struct dtc_rbcPBXFileReference_s {
    struct dtc_rbcPBXReference_s super;
};


extern void dtc_pbxfilereference_define(void);


extern VALUE dtc_pbxfilereference_new(PBXFileReference *filereference, VALUE parent_value);

extern VALUE dtc_pbxfilereference_alloc(VALUE klass);
extern VALUE dtc_pbxfilereference_initialize(VALUE self, PBXFileReference *filereference, VALUE parent_value);
extern void dtc_pbxfilereference_mark(struct dtc_rbcPBXFileReference_s *s);
extern void dtc_pbxfilereference_dealloc(struct dtc_rbcPBXFileReference_s *s);

extern PBXFileReference *dtc_pbxfilereference_pbxobject(VALUE object);

#endif
