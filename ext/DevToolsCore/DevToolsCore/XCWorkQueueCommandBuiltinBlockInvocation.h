//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCWorkQueueCommandBuiltinInvocation.h>

@interface XCWorkQueueCommandBuiltinBlockInvocation : XCWorkQueueCommandBuiltinInvocation
{
    id _block;
}

- (int)runTaskWithArguments:(id)arg1 environment:(id)arg2 workingDirectoryPath:(id)arg3;
- (void)finalize;
- (void)dealloc;
- (id)initWithSlotNumber:(unsigned long long)arg1 workQueueOperation:(id)arg2 workQueueCommand:(id)arg3 arguments:(id)arg4 environment:(id)arg5 workingDirectoryPath:(id)arg6 block:(id)arg7;

@end

