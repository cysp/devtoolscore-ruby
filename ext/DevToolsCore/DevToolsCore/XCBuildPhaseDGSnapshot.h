//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSArray, NSDictionary, NSString, XCBuildPhaseSpecification, XCTargetDGSnapshot;

@interface XCBuildPhaseDGSnapshot : NSObject
{
    XCTargetDGSnapshot *_targetSnapshot;
    XCBuildPhaseSpecification *_type;
    NSString *_name;
    NSDictionary *_buildSettings;
    NSArray *_allBuildRules;
    NSArray *_buildFileRefs;
    BOOL _runOnlyForDeploymentPostprocessing;
}

+ (id)defaultName;
- (id)applyBuildRulesToFileReference:(id)arg1 forArchitecture:(id)arg2 inTargetBuildContext:(id)arg3;
- (id)buildRuleForReference:(id)arg1 architecture:(id)arg2;
- (id)buildRuleForFileNamed:(id)arg1 ofType:(id)arg2 architecture:(id)arg3;
- (id)buildFilesToCountBaseNames;
- (BOOL)runOnlyForDeploymentPostprocessing;
- (id)allBuildRules;
- (id)buildFileRefs;
- (id)customBuildRules;
- (id)buildSettings;
- (id)name;
- (id)type;
- (id)targetSnapshot;
- (void)printForDebugging;
- (void)dealloc;
- (id)init;
- (id)initWithTargetSnapshot:(id)arg1;
- (id)initWithInformationFromBuildPhase:(id)arg1 forTargetSnapshot:(id)arg2;
- (void)enqueueCommandsOntoWorkQueue:(id)arg1;
- (void)computeDependenciesInTargetBuildContext:(id)arg1;
- (void)computeDependenciesForAllBuildFileReferencesInTargetBuildContext:(id)arg1;
- (void)computeDependenciesForBuildFileReference:(id)arg1 inTargetBuildContext:(id)arg2;
- (id)filteredBuildFileReferencesForTargetBuildContext:(id)arg1;

@end

