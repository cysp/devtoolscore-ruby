#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxobject.h"
#include "devtoolscore_pbxreference.h"
#include "devtoolscore_pbxfilereference.h"



VALUE dtc_pbxfilereference_new(PBXFileReference *filereference, VALUE parent_value) {
    VALUE self = dtc_pbxfilereference_alloc(dtc_rbcPBXFileReference);
    self = dtc_pbxfilereference_initialize(self, filereference, parent_value);
    return self;
}


VALUE dtc_pbxfilereference_alloc(VALUE klass) {
	struct dtc_rbcPBXFileReference_s *s = NULL;
	VALUE object_value = Data_Make_Struct(dtc_rbcPBXFileReference, struct dtc_rbcPBXFileReference_s, dtc_pbxfilereference_mark, dtc_pbxfilereference_dealloc, s);
    return object_value;
}

VALUE dtc_pbxfilereference_initialize(VALUE self, PBXFileReference *filereference, VALUE parent_value) {
    self = dtc_pbxreference_initialize(self, filereference, parent_value);
    return self;
}

void dtc_pbxfilereference_mark(struct dtc_rbcPBXFileReference_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}
    dtc_pbxreference_mark((struct dtc_rbcPBXReference_s *)s);
}

void dtc_pbxfilereference_dealloc(struct dtc_rbcPBXFileReference_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    dtc_pbxreference_dealloc((struct dtc_rbcPBXReference_s *)s);
}


PBXFileReference *dtc_pbxfilereference_pbxobject(VALUE object) {
	struct dtc_rbcPBXFileReference_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXFileReference_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXFileReference *)DTC_PBXOBJECT(s)->object;
}


void dtc_pbxfilereference_define(void) {
	if (!dtc_cPBXFileReference) {
		rb_raise(rb_eLoadError, "Could not find class PBXFileReference");
		return;
	}

	dtc_rbcPBXFileReference = rb_define_class_under(dtc_rbmDevToolsCore, "PBXFileReference", dtc_rbcPBXReference);
	rb_define_alloc_func(dtc_rbcPBXFileReference, dtc_alloc_raise);
}
