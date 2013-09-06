//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCPosixTask.h>

#import "PBXTSByteStreamConsuming.h"
#import "PBXTSCharacterStreamConsuming.h"
#import "PBXTSLineStreamConsuming.h"

@class NSLock, PBXTSByteStream, PBXTSStream;

@interface XCByteStreamPosixTask : XCPosixTask <PBXTSByteStreamConsuming, PBXTSCharacterStreamConsuming, PBXTSLineStreamConsuming>
{
    PBXTSByteStream *_byteStream;
    PBXTSStream *_streamTail;
    id <PBXTSStreamConsuming> _finalConsumer;
    long long _consumerType;
    NSLock *_streamLock;
}

- (void)streamDidEnd:(id)arg1;
- (void)stream:(id)arg1 processLine:(id)arg2;
- (void)stream:(id)arg1 processCharacters:(id)arg2;
- (void)stream:(id)arg1 processBytes:(id)arg2;
- (void)receivedStderrObjectInBackground:(id)arg1;
- (void)receivedStdoutObjectInBackground:(id)arg1;
- (void)_sendBytesInBackground:(id)arg1;
- (void)receivedStderrObject:(id)arg1;
- (void)receivedStdoutObject:(id)arg1;
- (void)outputComplete;
- (void)_detachConsumerFromBackground;
- (void)_attachConsumerOnBackground;
- (void)dealloc;
- (id)initWithLaunchInfo:(id)arg1;

@end

