//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSArray;

@interface XCDependencyGraphValidator : NSObject
{
    NSArray *_validationRules;
}

- (BOOL)performValidationsInBuildContext:(id)arg1;
- (void)dealloc;
- (id)initWithContentsOfFile:(id)arg1;
- (id)initWithValidationRulePropertyLists:(id)arg1;

@end
