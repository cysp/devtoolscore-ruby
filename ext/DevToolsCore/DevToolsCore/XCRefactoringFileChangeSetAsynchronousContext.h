//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class PBXProject;

@interface XCRefactoringFileChangeSetAsynchronousContext : NSObject
{
    id _delegate;
    PBXProject *_project;
    id _callbackTarget;
    SEL _callbackSelector;
}

- (SEL)callbackSelector;
- (id)callbackTarget;
- (id)project;
- (id)delegate;
- (void)dealloc;
- (id)initWithDelegate:(id)arg1 project:(id)arg2 callbackTarget:(id)arg3 callbackSelector:(SEL)arg4;

@end

