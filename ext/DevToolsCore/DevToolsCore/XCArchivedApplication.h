//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class NSMutableSet, NSSet, NSString, XCArchivedApplicationBuild;

@interface XCArchivedApplication : NSObject
{
    NSString *_bundleIdentifier;
    NSString *_platformIdentifier;
    NSMutableSet *_applicationBuilds;
    unsigned int _hasPlatformConflict:1;
}

+ (id)keyPathsForValuesAffectingLatestBuild;
+ (id)keyPathsForValuesAffectingApplicationVersion;
+ (id)keyPathsForValuesAffectingApplicationName;
+ (id)appWithBundleIdentifier:(id)arg1 andPlatformIdentifier:(id)arg2;
@property _Bool hasPlatformConflict; // @synthesize hasPlatformConflict=_hasPlatformConflict;
@property(copy) NSString *platformIdentifier; // @synthesize platformIdentifier=_platformIdentifier;
@property(copy) NSString *bundleIdentifier; // @synthesize bundleIdentifier=_bundleIdentifier;
@property(readonly) XCArchivedApplicationBuild *latestBuild;
- (id)sortedApplicationBuilds;
@property(readonly) NSString *applicationVersion;
@property(readonly) NSString *applicationName;
@property(readonly) NSString *platformDisplayName;
- (BOOL)isEqual:(id)arg1;
- (unsigned long long)hash;
- (id)mutableApplicationBuilds;
- (void)removeApplicationBuildsObject:(id)arg1;
- (void)addApplicationBuildsObject:(id)arg1;
- (id)memberOfApplicationBuilds:(id)arg1;
@property(readonly) NSSet *applicationBuilds;
- (id)description;
- (id)init;

@end

