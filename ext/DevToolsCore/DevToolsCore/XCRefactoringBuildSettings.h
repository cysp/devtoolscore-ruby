//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSDictionary;

@interface XCRefactoringBuildSettings : NSObject
{
    NSDictionary *_buildSettings;
    int _status;
}

- (int)buildSettingsStatus;
- (id)buildSettings;
- (void)dealloc;
- (id)initWithBuildSettings:(id)arg1 status:(int)arg2;

@end

