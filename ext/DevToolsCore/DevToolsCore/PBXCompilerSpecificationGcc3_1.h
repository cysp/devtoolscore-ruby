//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/PBXCompilerSpecificationGcc2_95_2.h>

@class XCStringList;

@interface PBXCompilerSpecificationGcc3_1 : PBXCompilerSpecificationGcc2_95_2
{
    XCStringList *_flagsToElideFromPrecompHash;
}

- (id)precompileHeaderFileAtPath:(id)arg1 forSourceFileOfType:(id)arg2 withExtraFlags:(id)arg3 toPrecompPath:(id)arg4 inTargetBuildContext:(id)arg5;
- (void)removeFlagsThatDoNotAffectPrecompValidityFromMutableArray:(id)arg1;
- (id)flagsForIncludingPrecompiledPrefixHeaderAtPath:(id)arg1 inTargetBuildContext:(id)arg2;
- (id)precompFileNameForHeaderPath:(id)arg1 inTargetBuildContext:(id)arg2;
- (void)dealloc;

@end

