//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCBuildLogSection.h>

@interface XCBuildLogTargetSection : XCBuildLogSection
{
    id <XCBuildables> _buildable;
}

+ (Class)logRecorderClass;
- (void)writeToSerializer:(id)arg1;
- (id)initFromDeserializer:(id)arg1;
- (void)logRecorder:(id)arg1 didStopRecordingWithInfo:(id)arg2;
- (id)buildable;
- (void)dealloc;
- (id)initWithTitle:(id)arg1 buildable:(id)arg2;
- (BOOL)isTargetSection;
- (BOOL)isTargetHeadingItem;

@end

