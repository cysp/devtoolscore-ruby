//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/SCMNode.h>

@class NSDictionary, SCMLog;

@interface SCMDirectoryEntry : SCMNode
{
    NSDictionary *_info;
    SCMLog *_log;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)arg1;
+ (void)initialize;
@property(retain) SCMLog *log; // @synthesize log=_log;
- (id)myself;
- (id)info;
- (void)finishInfo:(id)arg1;
- (void)setInfo:(id)arg1;
- (id)children;
- (void)finishList:(id)arg1;
- (BOOL)isLeaf;
- (id)createChildWithName:(id)arg1;
- (void)dealloc;
- (id)initWithModel:(id)arg1 parent:(id)arg2 name:(id)arg3 isDirectory:(BOOL)arg4;

@end

