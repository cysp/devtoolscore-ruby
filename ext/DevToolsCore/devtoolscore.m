#import <Foundation/Foundation.h>

#include <dlfcn.h>
#include <stdio.h>

#include "ruby.h"

#include "devtoolscore_pbxproject.h"
#include "devtoolscore_pbxgroup.h"
#include "devtoolscore_pbxfilereference.h"
#include "devtoolscore_pbxtarget.h"
#include "devtoolscore_pbxbuildphase.h"
#include "devtoolscore_pbxbuildfile.h"

#import "DevToolsCore.framework.h"


VALUE dtc_rbmDevToolsCore = 0;


#define DEVTOOLSCORE_DEFINE_CLASSES(klass) Class dtc_c##klass = nil; VALUE dtc_rbc##klass = 0;

DEVTOOLSCORE_DEFINE_CLASSES(PBXObject)
DEVTOOLSCORE_DEFINE_CLASSES(PBXContainer)
DEVTOOLSCORE_DEFINE_CLASSES(PBXProject)

DEVTOOLSCORE_DEFINE_CLASSES(PBXContainerItem)
DEVTOOLSCORE_DEFINE_CLASSES(PBXProjectItem)
DEVTOOLSCORE_DEFINE_CLASSES(PBXReference)
DEVTOOLSCORE_DEFINE_CLASSES(PBXFileReference)

DEVTOOLSCORE_DEFINE_CLASSES(PBXGroup)
DEVTOOLSCORE_DEFINE_CLASSES(PBXTargetGroup)
DEVTOOLSCORE_DEFINE_CLASSES(PBXVariantGroup)
DEVTOOLSCORE_DEFINE_CLASSES(XCVersionGroup)

DEVTOOLSCORE_DEFINE_CLASSES(PBXFramework)

DEVTOOLSCORE_DEFINE_CLASSES(PBXFolder)

DEVTOOLSCORE_DEFINE_CLASSES(PBXBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXAppleScriptBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXCopyFilesBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXFrameworksBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXHeadersBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXJavaArchiveBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXResourcesBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXRezBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXShellScriptBuildPhase)
DEVTOOLSCORE_DEFINE_CLASSES(PBXSourcesBuildPhase)

DEVTOOLSCORE_DEFINE_CLASSES(PBXBuildFile)

DEVTOOLSCORE_DEFINE_CLASSES(PBXTarget)

#undef DEVTOOLSCORE_DEFINE_CLASSES


void Init_devtoolscore() {
	NSString * const developerDir = @"/Applications/Xcode.app/Contents/Developer";
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
		if (![bundle loadAndReturnError:&error]) {
			rb_raise(rb_eLoadError, "Could not load %s: %s", path.UTF8String, error.localizedDescription.UTF8String);
			return;
		}
	}

	dtc_cPBXObject = NSClassFromString(@"PBXObject");

	dtc_cPBXContainer = NSClassFromString(@"PBXContainer");
	dtc_cPBXProject = NSClassFromString(@"PBXProject");
	dtc_cPBXFolder = NSClassFromString(@"PBXFolder");
	dtc_cPBXFramework = NSClassFromString(@"PBXFramework");

	dtc_cPBXContainerItem = NSClassFromString(@"PBXContainerItem");
	dtc_cPBXProjectItem = NSClassFromString(@"PBXProjectItem");

	dtc_cPBXReference = NSClassFromString(@"PBXReference");
	dtc_cPBXFileReference = NSClassFromString(@"PBXFileReference");

	dtc_cPBXFolder = NSClassFromString(@"PBXFolder");

	dtc_cPBXGroup = NSClassFromString(@"PBXGroup");
	dtc_cPBXVariantGroup = NSClassFromString(@"PBXVariantGroup");
	dtc_cPBXTargetGroup = NSClassFromString(@"PBXTargetGroup");
	dtc_cXCVersionGroup = NSClassFromString(@"XCVersionGroup");

	dtc_cPBXFramework = NSClassFromString(@"PBXFramework");

	dtc_cPBXBuildPhase = NSClassFromString(@"PBXBuildPhase");
	dtc_cPBXAppleScriptBuildPhase = NSClassFromString(@"PBXAppleScriptBuildPhase");
	dtc_cPBXCopyFilesBuildPhase = NSClassFromString(@"PBXCopyFilesBuildPhase");
	dtc_cPBXFrameworksBuildPhase = NSClassFromString(@"PBXFrameworksBuildPhase");
	dtc_cPBXHeadersBuildPhase = NSClassFromString(@"PBXHeadersBuildPhase");
	dtc_cPBXJavaArchiveBuildPhase = NSClassFromString(@"PBXJavaArchiveBuildPhase");
	dtc_cPBXResourcesBuildPhase = NSClassFromString(@"PBXResourcesBuildPhase");
	dtc_cPBXRezBuildPhase = NSClassFromString(@"PBXRezBuildPhase");
	dtc_cPBXShellScriptBuildPhase = NSClassFromString(@"PBXShellScriptBuildPhase");
	dtc_cPBXSourcesBuildPhase = NSClassFromString(@"PBXSourcesBuildPhase");

	dtc_cPBXBuildFile = NSClassFromString(@"PBXBuildFile");

	dtc_cPBXTarget = NSClassFromString(@"PBXTarget");

	dtc_rbmDevToolsCore = rb_define_module("DevToolsCore");

	dtc_rbcPBXObject = rb_define_class_under(dtc_rbmDevToolsCore, "PBXObject", rb_cObject);
	dtc_rbcPBXContainer = rb_define_class_under(dtc_rbmDevToolsCore, "PBXContainer", dtc_rbcPBXObject);
	dtc_rbcPBXContainerItem = rb_define_class_under(dtc_rbmDevToolsCore, "PBXContainerItem", dtc_rbcPBXObject);
	dtc_rbcPBXProjectItem = rb_define_class_under(dtc_rbmDevToolsCore, "PBXProjectItem", dtc_rbcPBXContainerItem);
	dtc_rbcPBXReference = rb_define_class_under(dtc_rbmDevToolsCore, "PBXReference", dtc_rbcPBXContainerItem);

	dtc_pbxproject_define();
	dtc_pbxgroup_define();
	dtc_pbxfilereference_define();
	dtc_pbxtarget_define();
	dtc_pbxbuildphase_define();
	dtc_pbxbuildfile_define();
}


VALUE dtc_alloc_raise(VALUE klass) {
	rb_raise(rb_eArgError, "Don't directly create objects of class %s", rb_class2name(klass));
	return Qnil;
}

VALUE dtc_klass_for_pbxobject(PBXObject *object) {
	Class const klass = [object class];

	if ([klass isSubclassOfClass:dtc_cPBXObject]) {
		if ([klass isSubclassOfClass:dtc_cPBXContainerItem]) {
			if ([klass isSubclassOfClass:dtc_cPBXProjectItem]) {
				if ([klass isSubclassOfClass:dtc_cPBXBuildPhase]) {
					if (klass == dtc_cPBXAppleScriptBuildPhase) return dtc_rbcPBXAppleScriptBuildPhase;
					if (klass == dtc_cPBXCopyFilesBuildPhase) return dtc_rbcPBXCopyFilesBuildPhase;
					if (klass == dtc_cPBXFrameworksBuildPhase) return dtc_rbcPBXFrameworksBuildPhase;
					if (klass == dtc_cPBXHeadersBuildPhase) return dtc_rbcPBXHeadersBuildPhase;
					if (klass == dtc_cPBXJavaArchiveBuildPhase) return dtc_rbcPBXJavaArchiveBuildPhase;
					if (klass == dtc_cPBXResourcesBuildPhase) return dtc_rbcPBXResourcesBuildPhase;
					if (klass == dtc_cPBXRezBuildPhase) return dtc_rbcPBXRezBuildPhase;
					if (klass == dtc_cPBXShellScriptBuildPhase) return dtc_rbcPBXShellScriptBuildPhase;
					if (klass == dtc_cPBXSourcesBuildPhase) return dtc_rbcPBXSourcesBuildPhase;
					return dtc_rbcPBXBuildPhase;
				}
				if ([klass isSubclassOfClass:dtc_cPBXTarget]) {
					return dtc_rbcPBXTarget;
				}
				return dtc_rbcPBXProjectItem;
			}
			if ([klass isSubclassOfClass:dtc_cPBXReference]) {
				if ([klass isSubclassOfClass:dtc_cPBXFileReference]) {
					return dtc_rbcPBXFileReference;
				}
				if ([klass isSubclassOfClass:dtc_cPBXGroup]) {
					return dtc_rbcPBXGroup;
				}
				return dtc_rbcPBXReference;
			}
			return dtc_rbcPBXContainerItem;
		}
		return dtc_rbcPBXObject;
	}
	return Qnil;
}

static bool dtc_rbclass_is_kind_of(VALUE klass, VALUE super) {
	while (klass) {
		if (klass == super) {
			return true;
		}
		klass = rb_class_superclass(klass);
	}
	return false;
}
VALUE dtc_pbxsomething_new(PBXObject *object, VALUE parent) {
	Class const klass = [object class];

	if ([klass isSubclassOfClass:dtc_cPBXObject]) {
		if ([klass isSubclassOfClass:dtc_cPBXContainerItem]) {
			if ([klass isSubclassOfClass:dtc_cPBXProjectItem]) {
				if ([klass isSubclassOfClass:dtc_cPBXBuildPhase]) {
					return dtc_pbxbuildphase_new((PBXBuildPhase *)object, parent);
				}
				if ([klass isSubclassOfClass:dtc_cPBXTarget]) {
					return dtc_pbxtarget_new((PBXTarget *)object, parent);
				}
				return Qnil;
			}
			if ([klass isSubclassOfClass:dtc_cPBXReference]) {
				if ([klass isSubclassOfClass:dtc_cPBXFileReference]) {
					return dtc_pbxfilereference_new((PBXFileReference *)object, parent);
				}
				if ([klass isSubclassOfClass:dtc_cPBXGroup]) {
					return dtc_pbxgroup_new((PBXGroup *)object, parent);
				}
				return Qnil;
			}
			return Qnil;
		}
		return Qnil;
	}

	return Qnil;
}

PBXObject *dtc_pbxsomething_pbxobject(VALUE object) {
	if (rb_obj_is_kind_of(object, dtc_rbcPBXObject)) {
		if (rb_obj_is_kind_of(object, dtc_rbcPBXContainerItem)) {
			if (rb_obj_is_kind_of(object, dtc_rbcPBXProjectItem)) {
				if (rb_obj_is_kind_of(object, dtc_rbcPBXBuildPhase)) {
					return dtc_pbxbuildphase_pbxobject(object);
				}
				if (rb_obj_is_kind_of(object, dtc_rbcPBXTarget)) {
					return dtc_pbxtarget_pbxobject(object);
				}
				return NULL;
			}
			if (rb_obj_is_kind_of(object, dtc_rbcPBXReference)) {
				if (rb_obj_is_kind_of(object, dtc_rbcPBXFileReference)) {
					return dtc_pbxfilereference_pbxobject(object);
				}
				if (rb_obj_is_kind_of(object, dtc_rbcPBXGroup)) {
					return dtc_pbxgroup_pbxobject(object);
				}
				return NULL;
			}
			return NULL;
		}
		return NULL;
	}

	return NULL;
}


/*
@interface PBXContainerItem : PBXObject
@interface PBXProjectItem : PBXContainerItem
@interface PBXTarget : PBXProjectItem
@interface PBXNativeTarget : PBXTarget
@interface PBXAggregateTarget : PBXNativeTarget
@interface PBXBuildPhase : PBXProjectItem
@interface PBXAppleScriptBuildPhase : PBXBuildPhase
@interface PBXJambaseTarget : PBXTarget
@interface PBXWrappedTarget : PBXJambaseTarget
@interface PBXApplicationTarget : PBXWrappedTarget
@interface PBXArchivingBinding : PBXArchiveBinding
@interface PBXBookmarkItem : PBXProjectItem
@interface PBXBookmark : PBXBookmarkItem
@interface PBXBookmarkGroup : PBXBookmarkItem
@interface PBXBreakpoint : PBXProjectItem <PBXMarkerDelegateProtocol>
@interface PBXBuildFile : PBXProjectItem
@interface PBXBuildRule : PBXProjectItem
@interface PBXBuildStyle : PBXProjectItem
@interface PBXBuildStyleBookmark : PBXBookmark
@interface PBXBundleTarget : PBXWrappedTarget
@interface PBXCPPExceptionBreakpoint : PBXBreakpoint
@interface PBXClearStickyTagsSCMScriptCommand : PBXAbstractSCMScriptCommand
@interface PBXCommitSCMScriptCommand : PBXAbstractSCMScriptCommand
@interface PBXCompareSCMScriptCommand : PBXAbstractSCMScriptCommand
@interface PBXConditionalArchivingBinding : PBXArchivingBinding
@interface PBXContainer : PBXObject
@interface PBXCopyFilesBuildPhase : PBXBuildPhase
@interface PBXDevKitIndexingEngine : PBXIndexingEngine
@interface PBXDiffSCMScriptCommand : PBXAbstractSCMScriptCommand
@interface PBXDocBookmark : PBXBookmark
@interface PBXExecutable : PBXProjectItem
@interface PBXExecutableBookmark : PBXBookmark
@interface PBXExternalTarget : PBXTarget
@interface PBXFileSystemLocation : PBXObject
@interface PBXFolder : PBXContainer
@interface PBXFramework : PBXContainer
@interface PBXFrameworkTarget : PBXWrappedTarget
@interface PBXFrameworksBuildPhase : PBXBuildPhase
@interface PBXHeadersBuildPhase : PBXBuildPhase
@interface PBXInterpretedExecutable : PBXExecutable
@interface PBXJavaArchiveBuildPhase : PBXBuildPhase
@interface PBXJavaClassFileEngine : PBXIndexingEngine
@interface PBXJavaLanguageEngine : PBXIndexingEngine
@interface PBXLegacyTarget : PBXTarget
@interface PBXLibraryTarget : PBXJambaseTarget
@interface PBXOldBreakpoint : PBXProjectItem
@interface PBXRefreshSCMScriptCommand : PBXAbstractSCMScriptCommand
@interface PBXResourcesBuildPhase : PBXBuildPhase
@interface PBXRezBuildPhase : PBXBuildPhase
@interface PBXShellScriptBuildPhase : PBXBuildPhase
@interface PBXSourcesBuildPhase : PBXBuildPhase
@interface PBXStandaloneTarget : PBXProject
@interface PBXSymbolicBreakpoint : PBXBreakpoint
@interface PBXTargetBookmark : PBXBookmark
@interface PBXTargetBuildContext : PBXBuildContext
@interface PBXTargetDependency : PBXProjectItem
@interface PBXTextBookmark : PBXBookmark
@interface PBXToolTarget : PBXJambaseTarget
@interface PBXTypeDescriptor : PBXIndexEntry
@interface PBXUnarchivingBinding : PBXArchiveBinding
@interface PBXUpdateSCMScriptCommand : PBXAbstractSCMScriptCommand
@interface XCBreakpointAction : PBXObject
@interface XCBreakpointCondition : PBXObject
@interface XCObjectBucket : PBXProjectItem
@interface XCBuildConfiguration : PBXBuildStyle
@interface XCBuildMessageTextBookmark : PBXTextBookmark
@interface XCByteStreamPosixTask : XCPosixTask
@interface XCConfigurationList : PBXProjectItem
@interface XCDiffFileBookmark : PBXBookmark
@interface XCProjectReferenceInfo : PBXProjectItem
*/
