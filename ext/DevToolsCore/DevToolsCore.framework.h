//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <Foundation/Foundation.h>
#include <stdarg.h>


//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#pragma mark -

@interface PBXObject : NSObject
@end

@interface PBXContainer : PBXObject
- (id)path;
- (id)absolutePath;
- (id)resolvedAbsolutePath;
- (id)name;
- (id)rootGroup;
- (id)modTime;
- (id)children;
- (id)allFileReferences;
- (id)allGroups;
- (id)allReferences;
- (id)allItemsOfClass:(Class)arg1;
- (id)allItems;
@end

@interface PBXProject : PBXContainer
+ (id)projectWithFile:(id)arg1 errorHandler:(id)arg2 readOnly:(BOOL)arg3;
- (id)path;
- (id)targets;
- (id)targetNamed:(id)arg1;
- (id)baseSDKIdentifierForTarget:(id)arg1;
- (id)baseSDKForTarget:(id)arg1;
- (id)buildConfigurationList;
- (id)buildConfigurations;
- (id)availableBuildConfigurationNames;
- (id)activeBuildConfigurationName;
- (BOOL)writeToFileSystemProjectFile:(BOOL)arg1 userFile:(BOOL)arg2 checkNeedsRevert:(BOOL)arg3;
- (BOOL)writeToFile:(NSString *)file projectFile:(BOOL)arg2 userFile:(BOOL)arg3 outResultNotification:(id *)arg4;
- (void)close;
- (BOOL)isClosed;
- (BOOL)canWriteToAuxiliaryProjectFileWithName:(id)arg1;
- (BOOL)canWriteToUserFile;
- (BOOL)canWriteToProjectFile;
- (BOOL)mayBeUnwritableProject;
- (BOOL)isReadOnly;
- (void)setOrganizationName:(id)arg1;
- (id)organizationName;
@end

@interface PBXContainerItem : PBXObject
@property (nonatomic,strong,readonly) id container;
@property (nonatomic,strong,readonly) id project;
@property (nonatomic,strong,readonly) NSArray *comments;
@end

@interface PBXProjectItem : PBXContainerItem
@end

@interface PBXBuildFile : PBXProjectItem
@property (nonatomic,strong,readonly) NSString *name;
@property (nonatomic,strong,readonly) NSString *path;
@property (nonatomic,strong,readonly) NSString *absolutePath;
@property (nonatomic,strong,readonly) NSString *resolvedAbsolutePath;
@property (nonatomic,strong,readonly) NSString *projectRelativePath;
@end

@interface PBXTarget : PBXProjectItem
@property (nonatomic,copy) NSString *name;
- (id)buildConfigurations;
- (id)expandedCurrentValueForBuildSetting:(id)arg1;
- (id)expandedCurrentValueForBuildSetting:(id)arg1 forConfigurationName:(id)arg2;
- (id)absoluteExpandedPathForString:(id)arg1;
- (id)absoluteExpandedPathForString:(id)arg1 forBuildConfigurationNamed:(id)arg2;
- (id)expandedValueForString:(id)arg1;
- (id)expandedValueForString:(id)arg1 forConfigurationNamed:(id)arg2;
- (id)stringByExpandingString:(id)arg1;
- (id)stringByExpandingString:(id)arg1 forBuildConfigurationNamed:(id)arg2;
- (id)productName;
- (id)productNameForConfigurationNamed:(id)arg1;
- (id)platform;
- (id)platformForConfigurationNamed:(id)arg1;
- (NSArray *)buildPhases; // PBXBuildPhase
- (id)missingDependencies;
@end

@interface PBXNativeTarget : PBXTarget
- (id)intermediatesLocation;
- (id)intermediatesLocationForConfigurationNamed:(id)arg1;
- (id)builtProductsLocation;
- (id)builtProductsLocationForConfigurationNamed:(id)arg1;
@end

@interface PBXAggregateTarget : PBXNativeTarget
@end

@interface PBXBuildPhase : PBXProjectItem
- (NSArray *)buildFiles; // PBXBuildFile
@end

@interface PBXAppleScriptBuildPhase : PBXBuildPhase
@end

@interface PBXJambaseTarget : PBXTarget
@end

@interface PBXWrappedTarget : PBXJambaseTarget
- (id)wrapperPathExtension;
- (id)wrapperPathExtensionForConfigurationNamed:(id)arg1;
- (id)productNameForConfigurationNamed:(id)arg1;
- (id)fullProductName;
- (id)fullProductNameForConfigurationNamed:(id)arg1;
@end

@interface PBXApplicationTarget : PBXWrappedTarget
@end

@interface PBXBuildSettingsDictionary : NSMutableDictionary
@end

@interface PBXBundleTarget : PBXWrappedTarget
@end

@interface PBXExternalTarget : PBXTarget
@end

@interface PBXReference : PBXContainerItem
@property (nonatomic,strong,readonly) NSString *projectRelativePath;
@end

@interface PBXFileReference : PBXReference
@end

@interface PBXFileSystemLocation : PBXObject
- (id)path;
@end

@interface PBXFolder : PBXContainer
- (id)rootGroup;
- (id)children;
@end

@interface PBXFramework : PBXContainer
- (id)absolutePathsOfPublicHeaderFiles;
- (id)absolutePathsOfPrivateHeaderFiles;
- (id)rootGroup;
@end

@interface PBXFrameworkTarget : PBXWrappedTarget
@end

@interface PBXFrameworksBuildPhase : PBXBuildPhase
@end

@interface PBXGlobalID : NSObject <NSCopying>
- (id)hexString;
- (id)representedObject;
@end

@interface PBXGroup : PBXReference
- (id)name;
@end

@interface PBXGroupEnumerator : NSEnumerator <NSCopying>
@end

@interface PBXLegacyTarget : PBXTarget
@end

@interface PBXLibraryTarget : PBXJambaseTarget
@end

@interface PBXProjectIndex : NSObject
- (id)project;
- (BOOL)isIndexing;
- (void)stopIndexing;
- (id)symbolsForProject;
@end

@interface PBXResourcesBuildPhase : PBXBuildPhase
@end

@interface PBXTargetDependency : PBXProjectItem
- (id)name;
- (id)target;
@end

@interface PBXTargetGroup : PBXGroup
@end

@interface PBXVariantGroup : PBXGroup
@end

@interface XCCodeSignContext : NSObject
@end

@interface XCConfigurationList : PBXProjectItem
- (id)buildConfigurationNames;
- (id)buildConfigurationForName:(id)arg1;
- (BOOL)buildConfigurationExistsForName:(id)arg1;
- (unsigned long long)countOfBuildConfigurations;
- (id)buildConfigurations;
@end

@interface XCVersionGroup : PBXGroup
- (id)versionForName:(id)arg1;
- (id)currentVersion;
@end
