#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxobject.h"
#include "devtoolscore_pbxreference.h"


VALUE dtc_pbxreference_alloc(VALUE klass) {
	struct dtc_rbcPBXReference_s *s = NULL;
	VALUE reference_value = Data_Make_Struct(dtc_rbcPBXReference, struct dtc_rbcPBXReference_s, dtc_pbxreference_mark, dtc_pbxreference_dealloc, s);
    return reference_value;
}

VALUE dtc_pbxreference_initialize(VALUE self, PBXReference *reference, VALUE parent_value) {
    self = dtc_pbxobject_initialize(self, reference);

	struct dtc_rbcPBXReference_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXReference_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	s->parent_value = parent_value;

	@autoreleasepool {
		NSString *referenceName = reference.name;
		if (referenceName) {
			VALUE reference_name_value = rb_str_new_cstr(referenceName.UTF8String);
			rb_ivar_set(self, rb_intern("@name"), reference_name_value);
		}
	}

	return self;
}

void dtc_pbxreference_mark(struct dtc_rbcPBXReference_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    dtc_pbxobject_mark((struct dtc_rbcPBXObject_s *)s);

	rb_gc_mark(s->parent_value);
}

void dtc_pbxreference_dealloc(struct dtc_rbcPBXReference_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    dtc_pbxobject_dealloc((struct dtc_rbcPBXObject_s *)s);
}


PBXReference *dtc_pbxreference_pbxobject(VALUE object) {
	struct dtc_rbcPBXReference_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXReference_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXReference *)DTC_PBXOBJECT(s)->object;
}


void dtc_pbxreference_define(void) {
	if (!dtc_cPBXReference) {
		rb_raise(rb_eLoadError, "Could not find class PBXReference");
		return;
	}

	dtc_rbcPBXReference = rb_define_class_under(dtc_rbmDevToolsCore, "PBXReference", dtc_rbcPBXContainerItem);
	rb_define_alloc_func(dtc_rbcPBXReference, dtc_alloc_raise);
	rb_define_attr(dtc_rbcPBXReference, "name", 1, 0);
}
