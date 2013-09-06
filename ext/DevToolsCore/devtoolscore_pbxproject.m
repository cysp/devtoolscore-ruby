#import <Foundation/Foundation.h>
#import "DevToolsCore/PBXProject.h"

#include "ruby.h"


static Class cPBXProject = NULL;

static VALUE rb_cPBXProject = 0;
struct rb_PBXProject_s {
	void *project;
};

static void pbxproject_initialize(VALUE self, VALUE project_path);
static void pbxproject_dealloc(VALUE self);

static VALUE pbxproject_alloc(VALUE klass) {
	struct rb_PBXProject_s *s = NULL;
	return Data_Make_Struct(klass, struct rb_PBXProject_s, NULL, pbxproject_dealloc, s);
}

static void pbxproject_initialize(VALUE self, VALUE project_path) {
	Check_Type(project_path, T_STRING);

	struct rb_PBXProject_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	NSString *path = [[NSString alloc] initWithUTF8String:RSTRING_PTR(project_path)];
	s->project = CFRetain([cPBXProject projectWithFile:path errorHandler:nil readOnly:YES]);
	fprintf(stderr, "pbxproject_initialize: s %p\n", s);
	fprintf(stderr, "pbxproject_initialize: p %p\n", s->project);
}

static void pbxproject_dealloc(VALUE self) {
	fprintf(stderr, "pbxproject_dealloc: self %p\n", self);
	struct rb_PBXProject_s *s = (struct rb_PBXProject_s *)self;
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	fprintf(stderr, "pbxproject_dealloc: s %p\n", s);
	PBXProject *p = s->project;
	fprintf(stderr, "pbxproject_dealloc: p %p\n", p);
	if (p) {
		CFRelease(p);
		CFRelease(p);
	}
}


static VALUE pbxproject_name(VALUE self) {
	struct rb_PBXProject_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXProject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	PBXProject *p = (PBXProject *)s->project;
	if (!p) {
		return Qnil;
	}

	NSString *pname = p.name;
	if (!pname) {
		return Qnil;
	}

	return rb_str_new_cstr(pname.UTF8String);
}


void devtoolscore_pbxproject_define(void) {
	cPBXProject = NSClassFromString(@"PBXProject");
	if (!cPBXProject) {
		rb_raise(rb_eLoadError, "Could not find class PBXProject");
		return;
	}
	rb_cPBXProject = rb_define_class("PBXProject", rb_cObject);
	rb_define_alloc_func(rb_cPBXProject, pbxproject_alloc);
	rb_define_method(rb_cPBXProject, "initialize", pbxproject_initialize, 1);
	rb_define_method(rb_cPBXProject, "name", pbxproject_name, 0);
}
