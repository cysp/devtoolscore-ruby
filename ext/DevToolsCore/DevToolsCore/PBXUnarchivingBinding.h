//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/PBXArchiveBinding.h>

@interface PBXUnarchivingBinding : PBXArchiveBinding
{
    BOOL _isScalar;
    void *_setValueMethod;
    SEL _unarchiveSelector;
    void *_unarchiveMethod;
}

- (void)readValueForObject:(id)arg1 fromPListUnarchiver:(id)arg2;
- (id)initWithKeyBinding:(id)arg1 archiveMask:(int)arg2;

@end

