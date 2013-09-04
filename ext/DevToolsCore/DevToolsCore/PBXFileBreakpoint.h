//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/PBXBreakpoint.h>

#import "NSCopying.h"

@class NSString;

@interface PBXFileBreakpoint : PBXBreakpoint <NSCopying>
{
    unsigned long long _debugTimestamp;
    NSString *_functionName;
}

+ (id)breakpointWithFileReference:(id)arg1 lineNumber:(unsigned long long)arg2;
+ (id)breakpointWithTextBookmark:(id)arg1;
+ (id)archivableRelationships;
+ (id)archivableAttributes;
- (void)purify;
- (long long)compareUsingLineNumber:(id)arg1;
- (void)willChange;
- (id)displayString;
- (long long)compareToBreakpoint:(id)arg1;
- (id)fileReference;
- (void)setFileReference:(id)arg1;
- (void)setDebugTimestamp:(unsigned long long)arg1;
- (id)locationDisplay;
- (id)functionName;
- (void)setFunctionName:(id)arg1;
- (id)innerDescription;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)release;
- (id)retain;
- (void)dealloc;
- (id)initWithTextBookmark:(id)arg1;
- (id)init;
- (id)initWithFileReference:(id)arg1 lineNumber:(unsigned long long)arg2;
- (id)gidCommentForArchive;
- (void)awakeFromPListUnarchiver:(id)arg1;
- (id)readFromPListUnarchiver:(id)arg1;

@end
