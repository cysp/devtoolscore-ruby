//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCRoots.h>

@class NSMutableDictionary;

@interface SCMRootToRepositoryMap : XCRoots
{
    NSMutableDictionary *_rootsToRepositories;
}

- (void)setRepositoryClass:(Class)arg1;
- (id)roots;
- (void)removeRoot:(id)arg1;
- (void)addRoot:(id)arg1;
- (BOOL)pathsOnSameVolume:(id)arg1;
- (void)setRepositoryName:(id)arg1 forRoot:(id)arg2;
- (id)repositoryForRoot:(id)arg1;
- (id)repositoryNameForRoot:(id)arg1;
- (id)dictionary;
- (id)description;
- (void)dealloc;
- (id)initWithDictionary:(id)arg1 project:(id)arg2;

@end
