//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class PBXProjectIndexBTree;

@interface PBXProjectIndexBTreeEnumerator : NSObject
{
    PBXProjectIndexBTree *_btree;
    _pbxbtreecursor_23e470bf _cursor;
    struct dispatch_queue_s *_treeAccessQueue;
}

- (unsigned int)previousValue;
- (unsigned int)nextValueForKey:(const void *)arg1;
- (unsigned int)nextValue;
- (unsigned int)valueForKey:(const void *)arg1;
- (unsigned int)lastValue;
- (unsigned int)firstValue;
- (id)initWithBTree:(id)arg1;

@end

