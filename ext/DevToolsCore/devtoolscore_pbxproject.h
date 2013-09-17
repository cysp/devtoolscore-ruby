#ifndef DEVTOOLSCORE_PBXPROJECT_H
#define DEVTOOLSCORE_PBXPROJECT_H

#include "devtoolscore.h"

struct dtc_rbcPBXProject_s {
	struct dtc_rbcPBXObject_s object;
	VALUE root_group_value;
	VALUE targets_value;
};
#define DTC_PBXJPROJECT_PROJECT(s) ((__bridge PBXProject *)(DTC_PBXOBJECT(s)->object))

extern void dtc_pbxproject_define(void);

//extern PBXProject *dtc_pbxproject_pbxobject(VALUE object);

#endif
