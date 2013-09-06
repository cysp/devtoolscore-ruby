//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class NSArray, NSDictionary, NSString, PBXGlobalID, PBXPackageTypeSpecification, XCPlatformSpecification, XCProductTypeSpecification, XCPropertyExpansionContext, XCSDKPackage;

@interface XCTargetDGSnapshot : NSObject
{
    NSString *_buildAction;
    NSString *_requestedConfigName;
    NSString *_effectiveConfigName;
    XCPropertyExpansionContext *_propertyExpansionContext;
    XCPlatformSpecification *_platform;
    XCSDKPackage *_sdk;
    NSArray *_projectConfigFileErrors;
    NSArray *_targetConfigFileErrors;
    PBXGlobalID *_globalID;
    NSString *_name;
    NSString *_productName;
    NSString *_fullProductName;
    NSString *_projectName;
    NSString *_projectDirectory;
    NSArray *_namesOfMissingDependencies;
    NSArray *_hmapCreationInfoForAllTargets;
    NSArray *_projectHeadermapFilePaths;
    NSArray *_implicitRezSearchPathFilePaths;
    BOOL _isAggregate;
    XCProductTypeSpecification *_productType;
    PBXPackageTypeSpecification *_packageType;
    NSArray *_buildPhases;
    NSString *_defaultConfigurationName;
    NSDictionary *_universalDefaultBuildSettings;
    NSDictionary *_buildSystemDefaultBuildSettings;
    NSDictionary *_applicationPreferencesBuildSettings;
    NSDictionary *_dynamicallyComputedProjectwideBuildSettings;
    NSArray *_projectBuildSettings;
    NSDictionary *_userProjectBuildSettings;
    NSDictionary *_dynamicallyComputedTargetBuildSettings;
    NSArray *_targetBuildSettings;
    NSDictionary *_projectOverridingBuildSettings;
    NSDictionary *_globalOverridingBuildSettings;
    NSDictionary *_commandLineXcconfigFileBuildSettings;
    NSDictionary *_environmentXcconfigFileBuildSettings;
    NSArray *_defaultBuildRules;
    NSArray *_customBuildRules;
    NSArray *_alternateBuildRules;
    NSDictionary *_productSettings;
    NSString *_infoPlistSourceFilePath;
    BOOL _shouldUseDistributedBuilds;
    int _distributedBuildSystemInUse;
    NSString *_distributedBuildToolCommandPath;
    NSString *_activeArchitecture;
}

+ (id)targetTypeName;
- (id)description;
- (id)pkgInfoContents;
- (id)productSettingsWithPrunedCFBundleEntries;
- (id)defaultRezBuildPhase;
- (id)defaultJavaArchiveBuildPhase;
- (id)defaultFrameworksBuildPhase;
- (id)defaultLinkBuildPhase;
- (id)defaultSourceCodeBuildPhase;
- (id)defaultResourceBuildPhase;
- (id)defaultHeaderBuildPhase;
- (id)buildPhaseOfClass:(Class)arg1;
- (BOOL)isAggregate;
- (BOOL)isJambased;
- (BOOL)isNative;
- (id)environmentXcconfigFileBuildSettings;
- (id)commandLineXcconfigFileBuildSettings;
- (id)globalOverridingBuildSettings;
- (id)projectOverridingBuildSettings;
- (id)targetBuildSettings;
- (id)dynamicallyComputedTargetBuildSettings;
- (id)userProjectBuildSettings;
- (id)projectBuildSettings;
- (id)dynamicallyComputedProjectwideBuildSettings;
- (id)applicationPreferencesBuildSettings;
- (id)buildSystemDefaultBuildSettings;
- (id)universalDefaultBuildSettings;
- (id)activeArchitecture;
- (id)defaultConfigurationName;
- (id)infoPlistSourceFilePath;
- (id)productSettings;
- (id)distributedBuildToolCommandPath;
- (int)distributedBuildSystemInUse;
- (BOOL)shouldUseDistributedBuilds;
- (id)alternateBuildRules;
- (id)customBuildRules;
- (id)defaultBuildRules;
- (id)buildPhases;
- (id)productParts;
- (id)packageType;
- (id)productType;
- (id)implicitRezSearchPathFilePaths;
- (id)projectHeadermapFilePaths;
- (id)targetHeadermapCreationInfoForAllTargets;
- (id)namesOfMissingDependencies;
- (id)projectDirectory;
- (id)projectName;
- (id)fullProductName;
- (id)productName;
- (id)name;
- (id)globalID;
- (id)sdk;
- (id)platform;
- (id)propertyExpansionContext;
- (id)effectiveConfigurationName;
- (id)requestedConfigurationName;
- (id)buildAction;
- (void)printForDebugging;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)dealloc;
- (id)init;
- (id)initWithInformationFromTarget:(id)arg1 withBuildState:(id)arg2;
- (void)enqueueCommandsOntoWorkQueue:(id)arg1;
- (void)computeDependenciesInTargetBuildContext:(id)arg1;

@end

