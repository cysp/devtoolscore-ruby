//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/PBXBookmark.h>

@class NSString;

@interface XCDiffFileBookmark : PBXBookmark
{
    NSString *_identifier;
    NSString *_defaultName;
}

+ (id)archiveNameForKey:(id)arg1;
+ (id)archivableAttributes;
+ (id)defaultWindowFrameAutosaveName;
- (id)innerDescription;
- (id)identifier;
- (unsigned long long)hash;
- (BOOL)isEqual:(id)arg1;
- (id)defaultName;
- (void)dealloc;
- (id)initWithFileReference:(id)arg1;
- (id)initWithIdentifier:(id)arg1 andName:(id)arg2;

@end

