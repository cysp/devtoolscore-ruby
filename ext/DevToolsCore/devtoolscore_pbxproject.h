#ifndef DEVTOOLSCORE_PBXPROJECT_H
#define DEVTOOLSCORE_PBXPROJECT_H

#include "ruby.h"
#include "devtoolscore_pbxobject.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXProject;
#else
# define PBXProject void
#endif


struct dtc_rbcPBXProject_s {
	struct dtc_rbcPBXObject_s super;
	VALUE root_group_value;
	VALUE targets_value;
};


extern void dtc_pbxproject_define(void);

extern VALUE dtc_pbxproject_alloc(VALUE klass);
extern VALUE dtc_pbxproject_initialize(VALUE object, PBXProject *project);
extern void dtc_pbxproject_mark(VALUE self);
extern void dtc_pbxproject_dealloc(VALUE self);

extern PBXProject *dtc_pbxproject_pbxobject(VALUE object);

#endif
