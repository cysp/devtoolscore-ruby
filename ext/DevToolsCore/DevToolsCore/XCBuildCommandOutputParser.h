//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCFilterOutputStream.h>

@class XCBuildLogSectionRecorder;

@interface XCBuildCommandOutputParser : XCFilterOutputStream
{
    XCBuildLogSectionRecorder *_logSectionRecorder;
}

- (void)writeBytes:(const char *)arg1 length:(unsigned long long)arg2;
- (void)setLogSectionRecorder:(id)arg1;
- (id)logSectionRecorder;
- (id)initWithNextOutputStream:(id)arg1;

@end

