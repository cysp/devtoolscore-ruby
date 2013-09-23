#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxobject.h"


VALUE dtc_pbxobject_alloc(VALUE klass) {
	struct dtc_rbcPBXObject_s *s = NULL;
	VALUE object_value = Data_Make_Struct(dtc_rbcPBXObject, struct dtc_rbcPBXObject_s, dtc_pbxobject_mark, dtc_pbxobject_dealloc, s);
    return object_value;
}

VALUE dtc_pbxobject_initialize(VALUE self, PBXObject *object) {
	struct dtc_rbcPBXObject_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXObject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		s->object = (__bridge_retained CFTypeRef)object;
	}

	return self;
}

void dtc_pbxobject_mark(struct dtc_rbcPBXObject_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}
}

void dtc_pbxobject_dealloc(struct dtc_rbcPBXObject_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    @autoreleasepool {
        CFTypeRef o = s->object;
        if (o) {
            CFRelease(o);
        }
    }
}


PBXObject *dtc_pbxobject_pbxobject(VALUE object) {
	struct dtc_rbcPBXObject_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXObject_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXObject *)s->object;
}


void dtc_pbxobject_define(void) {
	if (!dtc_cPBXObject) {
		rb_raise(rb_eLoadError, "Could not find class PBXObject");
		return;
	}

	dtc_rbcPBXObject = rb_define_class_under(dtc_rbmDevToolsCore, "PBXObject", rb_cObject);
	rb_define_alloc_func(dtc_rbcPBXObject, dtc_alloc_raise);
}
