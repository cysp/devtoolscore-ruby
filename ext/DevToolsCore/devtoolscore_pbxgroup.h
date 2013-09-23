#ifndef DEVTOOLSCORE_PBXGROUP_H
#define DEVTOOLSCORE_PBXGROUP_H

#include "ruby.h"
#include "devtoolscore_pbxreference.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXGroup;
#else
# define PBXGroup void
#endif


struct dtc_rbcPBXGroup_s {
    struct dtc_rbcPBXReference_s super;
	VALUE children_value;
};


extern void dtc_pbxgroup_define(void);

extern VALUE dtc_pbxgroup_new(PBXGroup *group, VALUE parent_value);

extern VALUE dtc_pbxgroup_alloc(VALUE klass);
extern VALUE dtc_pbxgroup_initialize(VALUE self, PBXGroup *group, VALUE parent_value);
extern void dtc_pbxgroup_mark(struct dtc_rbcPBXGroup_s *s);
extern void dtc_pbxgroup_dealloc(struct dtc_rbcPBXGroup_s *s);

extern PBXGroup *dtc_pbxgroup_pbxobject(VALUE object);

#endif
