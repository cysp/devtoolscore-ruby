#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxgroup.h"


VALUE dtc_pbxgroup_new(PBXGroup *group, VALUE parent_value) {
    VALUE self = dtc_pbxgroup_alloc(dtc_rbcPBXGroup);
    self = dtc_pbxgroup_initialize(self, group, parent_value);
    return self;
}


VALUE dtc_pbxgroup_alloc(VALUE klass) {
	struct dtc_rbcPBXGroup_s *s = NULL;
	VALUE self = Data_Make_Struct(dtc_rbcPBXGroup, struct dtc_rbcPBXGroup_s, dtc_pbxgroup_mark, dtc_pbxgroup_dealloc, s);
    return self;
}

VALUE dtc_pbxgroup_initialize(VALUE self, PBXGroup *group, VALUE parent_value) {
    self = dtc_pbxreference_initialize(self, group, parent_value);
    return self;
}

VALUE dtc_pbxgroup_initialize_rb(VALUE self, VALUE name_value) {
    name_value = StringValue(name_value);
    @autoreleasepool {
        NSString * const name = [[NSString alloc] initWithBytes:RSTRING_PTR(name_value) length:RSTRING_LEN(name_value) encoding:NSUTF8StringEncoding];
        PBXGroup *group = [dtc_cPBXGroup groupWithName:name];
        self = dtc_pbxreference_initialize(self, group, Qnil);
    }
    return self;
}


void dtc_pbxgroup_mark(struct dtc_rbcPBXGroup_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    dtc_pbxreference_mark((struct dtc_rbcPBXReference_s *)s);

	if (s->children_value) {
		rb_gc_mark(s->children_value);
	}
}

void dtc_pbxgroup_dealloc(struct dtc_rbcPBXGroup_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    dtc_pbxreference_dealloc((struct dtc_rbcPBXReference_s *)s);
}


PBXGroup *dtc_pbxgroup_pbxobject(VALUE object) {
	struct dtc_rbcPBXGroup_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXGroup_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXGroup *)DTC_PBXOBJECT(s)->object;
}


static VALUE pbxgroup_children(VALUE self) {
	struct dtc_rbcPBXGroup_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXGroup_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXGroup * const g = (__bridge PBXGroup *)DTC_PBXOBJECT(s)->object;
		if (!g) {
			rb_raise(rb_eArgError, "group is nil?");
			return Qnil;
		}

		VALUE children_value = s->children_value;
		if (children_value) {
			return children_value;
		}

		NSArray * const children = g.children;
		children_value = rb_ary_new2(children.count);
		for (PBXObject *child in children) {
			VALUE const child_value = dtc_pbxsomething_new(child, self) ?: Qnil;
			rb_ary_push(children_value, child_value);
		}

		s->children_value = children_value;

		return children_value;
	}
}

static VALUE pbxgroup_set_children(VALUE self, VALUE value) {
	struct dtc_rbcPBXGroup_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXGroup_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	Check_Type(value, T_ARRAY);

	@autoreleasepool {
		PBXGroup * const g = (__bridge PBXGroup *)DTC_PBXOBJECT(s)->object;
		if (!g) {
			rb_raise(rb_eArgError, "group is nil?");
			return Qnil;
		}

		s->children_value = 0;

		VALUE children_value = rb_obj_freeze(rb_ary_dup(value));
		long const children_value_length = RARRAY_LEN(children_value);
		for (long i = 0; i < children_value_length; ++i) {
			VALUE child_value = rb_ary_entry(children_value, i);
			if (!rb_obj_is_kind_of(child_value, dtc_rbcPBXObject)) {
				rb_raise(rb_eArgError, "[%ld] is not a PBXObject", i);
			}
			PBXObject *child = dtc_pbxsomething_pbxobject(child_value);
            if (!child) {
                rb_raise(rb_eArgError, "unable to determine type of child at index %ld", i);
            }
		}

		NSArray * const existingChildren = g.children;

        long i = 0;
		for (; i < children_value_length; ++i) {
			VALUE child_value = rb_ary_entry(children_value, i);
			PBXObject *child = dtc_pbxsomething_pbxobject(child_value);
			NSInteger foundIdx = [existingChildren indexOfObjectIdenticalTo:child];
			if (foundIdx != NSNotFound) {
				[g moveObject:child toIndex:i];
			} else {
				[g insertInChildren:child atIndex:i];
			}
		}
        for (; i < g.children.count; ++i) {
            [g removeFromChildrenAtIndex:i--];
        }

		return children_value;
	}
}


void dtc_pbxgroup_define(void) {
	if (!dtc_cPBXGroup) {
		rb_raise(rb_eLoadError, "Could not find class PBXGroup");
		return;
	}

	dtc_rbcPBXGroup = rb_define_class_under(dtc_rbmDevToolsCore, "PBXGroup", dtc_rbcPBXReference);
	rb_define_alloc_func(dtc_rbcPBXGroup, dtc_pbxgroup_alloc);
    rb_define_method(dtc_rbcPBXGroup, "initialize", dtc_pbxgroup_initialize_rb, 1);
	rb_define_method(dtc_rbcPBXGroup, "children", pbxgroup_children, 0);
	rb_define_method(dtc_rbcPBXGroup, "children=", pbxgroup_set_children, 1);
}
