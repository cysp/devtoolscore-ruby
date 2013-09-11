#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxfilereference.h"


struct dtc_rbcPBXFileReference_s {
	CFTypeRef filereference;
	VALUE parent_value;
	VALUE children_value;
};


static void pbxfilereference_mark(struct dtc_rbcPBXFileReference_s *s);
static void pbxfilereference_dealloc(struct dtc_rbcPBXFileReference_s *s);

VALUE dtc_pbxfilereference_new(PBXFileReference *filereference, VALUE parent_value) {
	struct dtc_rbcPBXFileReference_s *s = NULL;
	VALUE filereference_value = Data_Make_Struct(dtc_rbcPBXFileReference, struct dtc_rbcPBXFileReference_s, pbxfilereference_mark, pbxfilereference_dealloc, s);
	s->parent_value = parent_value;

	@autoreleasepool {
		s->filereference = (__bridge_retained CFTypeRef)filereference;

		NSString *filereferenceName = filereference.name;
		if (filereferenceName) {
			VALUE filereference_name_value = rb_str_new_cstr(filereferenceName.UTF8String);
			rb_ivar_set(filereference_value, rb_intern("@name"), filereference_name_value);
		}
	}

	return filereference_value;
}

PBXFileReference *dtc_pbxfilereference_pbxobject(VALUE object) {
	struct dtc_rbcPBXFileReference_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXFileReference_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXFileReference *)s->filereference;
}

static void pbxfilereference_mark(struct dtc_rbcPBXFileReference_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	rb_gc_mark(s->parent_value);
	if (s->children_value) {
		rb_gc_mark(s->children_value);
	}
}

static void pbxfilereference_dealloc(struct dtc_rbcPBXFileReference_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	@autoreleasepool {
		CFTypeRef p = s->filereference;
		if (p) {
			CFRelease(p);
		}
	}
}


static VALUE pbxfilereference_children(VALUE self) {
	struct dtc_rbcPBXFileReference_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXFileReference_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXFileReference * const p = (__bridge PBXFileReference *)s->filereference;
		if (!p) {
			rb_raise(rb_eArgError, "filereference is nil?");
			return Qnil;
		}

		VALUE children_value = s->children_value;
		if (children_value) {
			return children_value;
		}

		NSArray * const children = p.children;
		children_value = rb_ary_new2(children.count);
		for (PBXObject *child in children) {
			VALUE const child_value = dtc_pbxsomething_new(child, self) ?: Qnil;
			rb_ary_push(children_value, child_value);
		}

		s->children_value = children_value;

		return children_value;
	}
}


void dtc_pbxfilereference_define(void) {
	if (!dtc_cPBXFileReference) {
		rb_raise(rb_eLoadError, "Could not find class PBXFileReference");
		return;
	}

	dtc_rbcPBXFileReference = rb_define_class_under(dtc_rbmDevToolsCore, "PBXFileReference", dtc_rbcPBXReference);
	rb_define_alloc_func(dtc_rbcPBXFileReference, dtc_alloc_raise);
	rb_define_attr(dtc_rbcPBXFileReference, "name", 1, 0);
	rb_define_method(dtc_rbcPBXFileReference, "children", pbxfilereference_children, 0);
}
