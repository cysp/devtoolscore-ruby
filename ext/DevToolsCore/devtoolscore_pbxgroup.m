#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxgroup.h"


struct dtc_rbcPBXGroup_s {
	CFTypeRef group;
	VALUE parent_value;
	VALUE children_value;
};


static void pbxgroup_mark(struct dtc_rbcPBXGroup_s *s);
static void pbxgroup_dealloc(struct dtc_rbcPBXGroup_s *s);

VALUE dtc_pbxgroup_new(PBXGroup *group, VALUE parent_value) {
	struct dtc_rbcPBXGroup_s *s = NULL;
	VALUE group_value = Data_Make_Struct(dtc_rbcPBXGroup, struct dtc_rbcPBXGroup_s, pbxgroup_mark, pbxgroup_dealloc, s);
	s->parent_value = parent_value;

	@autoreleasepool {
		s->group = (__bridge_retained CFTypeRef)group;

		NSString *groupName = group.name;
		if (groupName) {
			VALUE group_name_value = rb_str_new_cstr(groupName.UTF8String);
			rb_ivar_set(group_value, rb_intern("@name"), group_name_value);
		}
	}

	return group_value;
}

PBXGroup *dtc_pbxgroup_pbxobject(VALUE object) {
	struct dtc_rbcPBXGroup_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXGroup_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXGroup *)s->group;
}

static void pbxgroup_mark(struct dtc_rbcPBXGroup_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	rb_gc_mark(s->parent_value);
	if (s->children_value) {
		rb_gc_mark(s->children_value);
	}
}

static void pbxgroup_dealloc(struct dtc_rbcPBXGroup_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	@autoreleasepool {
		CFTypeRef g = s->group;
		if (g) {
			CFRelease(g);
		}
	}
}


static VALUE pbxgroup_children(VALUE self) {
	struct dtc_rbcPBXGroup_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXGroup_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		PBXGroup * const g = (__bridge PBXGroup *)s->group;
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
		PBXGroup * const g = (__bridge PBXGroup *)s->group;
		if (!g) {
			rb_raise(rb_eArgError, "group is nil?");
			return Qnil;
		}

		s->children_value = 0;

		VALUE children_value = rb_obj_freeze(rb_ary_dup(value));
		long const children_value_length = RARRAY_LEN(children_value);
		for (long i = 0; i < children_value_length; ++i) {
			VALUE obj = rb_ary_entry(children_value, i);
			if (!rb_obj_is_kind_of(obj, dtc_rbcPBXObject)) {
				rb_raise(rb_eArgError, "[%ld] is not a PBXObject", i);
			}
		}

		NSArray * const existingChildren = g.children;

		for (long i = 0; i < children_value_length; ++i) {
			VALUE child_value = rb_ary_entry(children_value, i);
			PBXObject *child = dtc_pbxsomething_pbxobject(child_value);
			NSInteger foundIdx = [existingChildren indexOfObjectIdenticalTo:child];
			if (foundIdx != NSNotFound) {
				[g moveObject:child toIndex:i];
			} else {
				[g insertInChildren:child atIndex:i];
			}
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
	rb_define_alloc_func(dtc_rbcPBXGroup, dtc_alloc_raise);
	rb_define_attr(dtc_rbcPBXGroup, "name", 1, 0);
	rb_define_method(dtc_rbcPBXGroup, "children", pbxgroup_children, 0);
	rb_define_method(dtc_rbcPBXGroup, "children=", pbxgroup_set_children, 1);
}
