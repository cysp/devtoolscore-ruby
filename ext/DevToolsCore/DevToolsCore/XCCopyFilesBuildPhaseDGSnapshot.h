//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCBuildPhaseDGSnapshot.h>

@class NSString;

@interface XCCopyFilesBuildPhaseDGSnapshot : XCBuildPhaseDGSnapshot
{
    int _dstSubfolderSpec;
    NSString *_dstPath;
}

+ (id)defaultName;
- (id)destinationPath;
- (int)destinationSubfolder;
- (void)dealloc;
- (id)initWithInformationFromBuildPhase:(id)arg1 forTargetSnapshot:(id)arg2;
- (void)computeDependenciesForBuildFileReference:(id)arg1 inTargetBuildContext:(id)arg2;

@end

