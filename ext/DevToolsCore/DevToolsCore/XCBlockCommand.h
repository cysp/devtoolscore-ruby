//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCWorkQueueCommand.h>

@interface XCBlockCommand : XCWorkQueueCommand
{
    id _block;
}

+ (id)commandWithBlock:(id)arg1;
- (id)description;
- (id)createStartedCommandInvocationInSlot:(unsigned long long)arg1 ofWorkQueueOperation:(id)arg2;
- (id)instantiatedCommandOutputParserWithLogSectionRecorder:(id)arg1;
- (id)descriptionForWorkQueueLog;
- (id)subprocessCommandLineForProcessing;
- (id)ruleInfo;
- (BOOL)isReadyForProcessing;
- (void)finalize;
- (void)dealloc;
- (id)initWithBlock:(id)arg1;

@end

