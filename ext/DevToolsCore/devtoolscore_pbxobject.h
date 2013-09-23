#ifndef DEVTOOLSCORE_PBXOBJECT_H
#define DEVTOOLSCORE_PBXOBJECT_H

#import <CoreFoundation/CoreFoundation.h>

#include "ruby.h"
#include "devtoolscore.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXObject;
#else
# ifndef PBXObject
#  define PBXObject void
# endif
#endif


struct dtc_rbcPBXObject_s {
    CFTypeRef object;
};
#define DTC_PBXOBJECT(s) ((struct dtc_rbcPBXObject_s *)s)


extern void dtc_pbxobject_define(void);


extern VALUE dtc_klass_for_pbxobject(PBXObject *object);

extern VALUE dtc_pbxsomething_new(PBXObject *object, VALUE parent);

extern VALUE dtc_pbxobject_initialize(VALUE self, PBXObject *object);
extern void dtc_pbxobject_mark(struct dtc_rbcPBXObject_s *s);
extern void dtc_pbxobject_dealloc(struct dtc_rbcPBXObject_s *s);

extern PBXObject *dtc_pbxsomething_pbxobject(VALUE object);

#endif
