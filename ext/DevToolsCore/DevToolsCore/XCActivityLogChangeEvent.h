//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class XCActivityLogSection;

@interface XCActivityLogChangeEvent : NSObject
{
    XCActivityLogSection *_changedParent;
    XCActivityLogSection *_addedChild;
}

- (id)description;
- (id)addedChild;
- (id)changedParent;
- (void)dealloc;
- (id)initWithChangedParent:(id)arg1 addedChild:(id)arg2;

@end

