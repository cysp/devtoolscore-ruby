//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCBuildPhaseDGSnapshot.h>

@class NSString;

@interface XCCompileAndLinkMachOBuildPhaseDGSnapshot : XCBuildPhaseDGSnapshot
{
    NSString *_variant;
    NSString *_arch;
}

+ (id)defaultName;
- (id)initWithTargetSnapshot:(id)arg1;
- (void)computeDependenciesInTargetBuildContext:(id)arg1;
- (void)computeDependenciesForBuildFileReference:(id)arg1 inTargetBuildContext:(id)arg2;

@end

