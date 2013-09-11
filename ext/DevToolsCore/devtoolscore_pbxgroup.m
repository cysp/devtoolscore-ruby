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
		CFTypeRef p = s->group;
		if (p) {
			CFRelease(p);
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
		PBXGroup * const p = (__bridge PBXGroup *)s->group;
		if (!p) {
			rb_raise(rb_eArgError, "group is nil?");
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


void dtc_pbxgroup_define(void) {
	if (!dtc_cPBXGroup) {
		rb_raise(rb_eLoadError, "Could not find class PBXGroup");
		return;
	}

	dtc_rbcPBXGroup = rb_define_class_under(dtc_rbmDevToolsCore, "PBXGroup", dtc_rbcPBXReference);
	rb_define_alloc_func(dtc_rbcPBXGroup, dtc_alloc_raise);
	rb_define_attr(dtc_rbcPBXGroup, "name", 1, 0);
	rb_define_method(dtc_rbcPBXGroup, "children", pbxgroup_children, 0);
}
