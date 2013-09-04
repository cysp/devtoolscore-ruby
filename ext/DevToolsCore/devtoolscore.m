#import "ruby.h"

static NSBundle *devtoolscore_bundle = nil;

VALUE rb_cPBXProject = nil;
struct rb_PBXProject_s {
	void *object;
};


static VALUE pbxproject_alloc(VALUE klass);
static void pbxproject_initialize(VALUE self, VALUE project_path);
static void pbxproject_dealloc(VALUE object);

void Init_devtoolscore() {
	devtoolscore_bundle = [[NSBundle alloc] initWithPath:@"/Applications/Xcode5-DP6.app/Contents/OtherFrameworks/DevToolsCore.framework"];
	if (!devtoolscore_bundle) {
		rb_raise(rb_eLoadError, "Could not load DevToolsCore.framework bundle");
		return;
	}

	NSError *error = nil;
	if (![devToolsCoreBundle loadAndReturnError:&error]) {
		rb_raise(rb_eLoadError, "Could not load DevToolsCore.framework code: %s", error.localizedDescription.UTF8String);
		return;
	}

	void(*IDEInitialize)(NSUInteger initializationOptions, NSError **error) = dlsym(RTLD_DEFAULT, "IDEInitialize");
	if (!IDEInitialize) {
		rb_raise(rb_eLoadError, "Could not find IDEInitialize()");
		return;
	}

	{
		// Temporary redirect stderr to /dev/null in order not to print plugin loading errors
		// Adapted from http://stackoverflow.com/questions/4832603/how-could-i-temporary-redirect-stdout-to-a-file-in-a-c-program/4832902#4832902
		fflush(stderr);
		int saved_stderr = dup(STDERR_FILENO);
		int dev_null = open("/dev/null", O_WRONLY);
		dup2(dev_null, STDERR_FILENO);
		close(dev_null);
		NSError *error = nil;
		// -[Xcode3CommandLineBuildTool run] from Xcode3Core.ideplugin calls IDEInitialize(1, &error)
		IDEInitialize(1, &error);
		fflush(stderr);
		dup2(saved_stderr, STDERR_FILENO);
		close(saved_stderr);
		if (error) {
			rb_raise(rb_eLoadError, "IDEInitialize error: %s", error.localizedDescription.UTF8String);
			return;
		}
	}


	rb_cPBXProject = rb_define_class("PBXProject", rb_cObject);
	rb_define_alloc_func(rb_cPBXProject, pbxproject_alloc);
	rb_define_method(rb_cPBXProject, "initialize", pbxproject_initialize, 1);
}

static VALUE pbxproject_alloc(VALUE klass) {
	struct rb_PBXProject_s *s = NULL;
	return Data_Make_Struct(klass, struct rb_PBXProject_s, NULL, pbxproject_dealloc, s);
}

static void pbxproject_initialize(VALUE self, VALUE project_path) {
	Check_Type(project_path, T_STRING);

	struct rb_PBXProject_s *s = NULL;
	Data_Get_Struct(self, struct rb_PBXProject_s, string);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

	NSString *path = [[NSString alloc] initWithUTF8String:project_path];
	s->p = [[PBXProject alloc] initWithPath:path];
}

static void pbxproject_dealloc(VALUE object) {
	struct rb_PBXProject_s *s = Data_Get_Struct(object, struct rb_PBXProject_s, struct rb_PBXProject_s *);
	if (!s) {
		return;
	}

	PBXProject *p = (PBXProject *)s->object;
	if (p) {
		CFRelease(p);
	}
	free(s);
}
