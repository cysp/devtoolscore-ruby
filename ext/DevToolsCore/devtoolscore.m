#import <Foundation/Foundation.h>

#include <dlfcn.h>
#include <stdio.h>

#include "ruby.h"

#include "devtoolscore_pbxproject.h"


static NSBundle *devtoolscore_bundle = nil;
static NSBundle *devtoolsfoundation_bundle = nil;


void Init_devtoolscore_ext() {
	NSString * const bundlePath = @"/Applications/Xcode5-DP6.app/Contents/OtherFrameworks";
	//NSString * const bundlePath = @"/Applications/Xcode5-DP6.app/Contents/PlugIns/Xcode3Core.ideplugin/Contents/Frameworks";
	devtoolscore_bundle = [[NSBundle alloc] initWithPath:[bundlePath stringByAppendingPathComponent:@"DevToolsCore.framework"]];
	if (!devtoolscore_bundle) {
		rb_raise(rb_eLoadError, "Could not load DevToolsCore.framework bundle");
		return;
	}
	devtoolsfoundation_bundle = [[NSBundle alloc] initWithPath:[bundlePath stringByAppendingPathComponent:@"DevToolsFoundation.framework"]];
	if (!devtoolsfoundation_bundle) {
		rb_raise(rb_eLoadError, "Could not load DevToolsFoundation.framework bundle");
		return;
	}

	NSError *error = nil;
	if (![devtoolscore_bundle loadAndReturnError:&error]) {
		rb_raise(rb_eLoadError, "Could not load DevToolsCore.framework code: %s", error.localizedDescription.UTF8String);
		return;
	}

	void(*XCInitializeCoreIfNeeded)(BOOL hasGUI) = dlsym(RTLD_DEFAULT, "XCInitializeCoreIfNeeded");
	//void(*IDEInitialize)(NSUInteger initializationOptions, NSError **error) = dlsym(RTLD_DEFAULT, "IDEInitialize");
	if (!XCInitializeCoreIfNeeded) {
		rb_raise(rb_eLoadError, "Could not find XCInitializeCoreIfNeeded()");
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
		XCInitializeCoreIfNeeded(NO);
		fflush(stderr);
		dup2(saved_stderr, STDERR_FILENO);
		close(saved_stderr);
		if (error) {
			rb_raise(rb_eLoadError, "XCInitializeCoreIfNeeded error: %s", error.localizedDescription.UTF8String);
			return;
		}
	}


	devtoolscore_pbxproject_define();
}
