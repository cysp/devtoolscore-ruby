//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCPosixTask.h>

@class NSMutableData;

@interface XCPosixTaskSelfTest : XCPosixTask
{
    NSMutableData *stdoutData;
    NSMutableData *stderrData;
    BOOL outputComplete;
    BOOL terminated;
}

- (BOOL)waitForOutputComplete;
- (BOOL)waitForTerminated;
- (BOOL)_waitForFlag:(char *)arg1;
- (void)processTerminated;
- (void)outputComplete;
- (void)receivedStderrObject:(id)arg1;
- (void)receivedStdoutObject:(id)arg1;
- (BOOL)terminated;
- (id)stderrResults;
- (id)stdoutResults;
- (void)dealloc;

@end

