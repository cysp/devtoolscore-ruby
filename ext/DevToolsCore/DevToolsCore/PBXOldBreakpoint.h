//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/PBXProjectItem.h>

@class NSMutableString, PBXFileReference;

@interface PBXOldBreakpoint : PBXProjectItem
{
    int _state;
    PBXFileReference *_fileReference;
    unsigned long long _lineNumber;
    NSMutableString *_symbol;
}

+ (id)archivableRelationships;
+ (id)archivableAttributes;
- (id)_specificBreakpointFromOldBreakpoint;
- (id)container;
- (void)dealloc;

@end

