//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCFilterOutputStream.h>

@interface XCLineBufferedOutputStream : XCFilterOutputStream
{
    char *_bufferedBytes;
    unsigned long long _numBufferedBytes;
}

- (void)flush;
- (void)writeBytes:(const char *)arg1 length:(unsigned long long)arg2;
- (void)finalize;
- (void)dealloc;
- (id)initWithNextOutputStream:(id)arg1;

@end

