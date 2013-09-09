#import <Foundation/Foundation.h>

#include <dlfcn.h>
#include <stdio.h>

#include "ruby.h"

#include "devtoolscore_pbxproject.h"
#include "devtoolscore_pbxtarget.h"
#include "devtoolscore_pbxbuildphase.h"
#include "devtoolscore_pbxbuildfile.h"


/*
static NSBundle *devtoolscore_bundle = nil;
static NSBundle *devtoolsfoundation_bundle = nil;
static NSBundle *dvtfoundation_bundle = nil;
static NSBundle *dvtkit_bundle = nil;
static NSBundle *idefoundation_bundle = nil;
static NSBundle *idekit_bundle = nil;
static NSBundle *xcode3core_bundle = nil;
*/

VALUE rb_mDevToolsCore = 0;


void Init_devtoolscore() {
	NSString * const developerDir = @"/Applications/Xcode5-DP6.app/Contents/Developer/";
	NSArray * const bundlePaths = @[
		@"../OtherFrameworks/DevToolsCore.framework",
		//@"../OtherFrameworks/DevToolsFoundation.framework",
		//@"../SharedFrameworks/DVTFoundation.framework",
		//@"../SharedFrameworks/DVTKit.framework",
		//@"../Frameworks/IDEFoundation.framework",
		//@"../Frameworks/IDEKit.framework",
		//@"../PlugIns/Xcode3Core.ideplugin",
		//@"../PlugIns/Xcode3Core.ideplugin/Contents/Frameworks/DevToolsCore.framework",
		//@"../PlugIns/Xcode3Core.ideplugin/Contents/Frameworks/DevToolsFoundation.framework",
		//@"../PlugIns/Xcode3Core.ideplugin/Contents/Frameworks/DevToolsSupport.framework",
	];

	for (NSString *bundlePath in bundlePaths) {
		NSString * const path = [[developerDir stringByAppendingPathComponent:bundlePath] stringByStandardizingPath];
		NSBundle *bundle = [[NSBundle alloc] initWithPath:path];
		if (!bundle) {
			rb_raise(rb_eLoadError, "Could not load %s", path.UTF8String);
			return;
		}
		NSError *error = nil;
		if (0) {
		[bundle loadAndReturnError:&error];
		} else
		if (![bundle loadAndReturnError:&error]) {
			rb_raise(rb_eLoadError, "Could not load %s: %s", path.UTF8String, error.localizedDescription.UTF8String);
			return;
		}
	}

	/*
	void(*IDEInitialize)(NSUInteger initializationOptions, NSError **error) = dlsym(RTLD_DEFAULT, "IDEInitialize");
	if (!IDEInitialize) {
		rb_raise(rb_eLoadError, "Could not find IDEInitialize()");
		return;
	}

	void(*XCInitializeCoreIfNeeded)(BOOL hasGUI) = dlsym(RTLD_DEFAULT, "XCInitializeCoreIfNeeded");
	if (!XCInitializeCoreIfNeeded) {
		rb_raise(rb_eLoadError, "Could not find XCInitializeCoreIfNeeded()");
		return;
	}
	*/

#if 0
	if (0) {
		/*
		// Temporary redirect stderr to /dev/null in order not to print plugin loading errors
		// Adapted from http://stackoverflow.com/questions/4832603/how-could-i-temporary-redirect-stdout-to-a-file-in-a-c-program/4832902#4832902
		fflush(stderr);
		int saved_stderr = dup(STDERR_FILENO);
		int dev_null = open("/dev/null", O_WRONLY);
		dup2(dev_null, STDERR_FILENO);
		close(dev_null);
		*/
		NSError *error = nil;
		// -[Xcode3CommandLineBuildTool run] from Xcode3Core.ideplugin calls IDEInitialize(1, &error)
		XCInitializeCoreIfNeeded(0);
		/*
		fflush(stderr);
		dup2(saved_stderr, STDERR_FILENO);
		close(saved_stderr);
		*/
		if (error) {
			rb_raise(rb_eLoadError, "XCInitializeCoreIfNeeded error: %s", error.localizedDescription.UTF8String);
			return;
		}
	}
#endif

	rb_mDevToolsCore = rb_define_module("DevToolsCore");

	devtoolscore_pbxproject_define();
	devtoolscore_pbxtarget_define();
	devtoolscore_pbxbuildphase_define();
	devtoolscore_pbxbuildfile_define();
}

VALUE devtoolscore_alloc_raise(VALUE klass) {
	rb_raise(rb_eArgError, "Don't directly create objects of class %s", rb_class2name(klass));
	return Qnil;
}
