//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSString, PBXExecutable;

@interface XCAppleScriptEnvironmentVariable : NSObject
{
    long long _index;
    PBXExecutable *_executable;
    NSString *_name;
    NSString *_value;
    BOOL _active;
}

- (id)objectSpecifier;
- (void)handleMoveCommand:(id)arg1;
- (void)setActive:(BOOL)arg1;
- (void)_setActive:(BOOL)arg1;
- (BOOL)active;
- (void)setValue:(id)arg1;
- (void)_setValue:(id)arg1;
- (id)value;
- (void)setName:(id)arg1;
- (void)_setName:(id)arg1;
- (id)name;
- (void)setIndex:(long long)arg1;
- (long long)index;
- (id)environmentEntries;
- (void)setExecutable:(id)arg1;
- (id)executable;
- (void)dealloc;
- (id)init;

@end

