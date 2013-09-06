//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class NSOutputStream, NSString;

@interface XCTrace : NSObject
{
    int _lock;
    NSString *_filePackagePath;
    NSOutputStream *_timelineStream;
    double _baseTime;
}

+ (id)sharedTrace;
+ (id)defaultTraceName;
+ (id)defaultTraceDirectoryPath;
+ (void)setCurrentThreadName:(unsigned int)arg1;
+ (void)initialize;
- (void)addAttachment:(id)arg1 withName:(id)arg2;
- (void)addEvent:(id)arg1;
- (void)endActivity:(id)arg1;
- (void)beginActivity:(id)arg1;
- (void)finalize;
- (void)dealloc;
- (void)close;
- (id)init;
- (id)initWithName:(id)arg1;
- (id)initWithPath:(id)arg1;

@end

