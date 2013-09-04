//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCOperation.h>

@class NSMutableArray, NSMutableSet, NSNumber, NSOperationQueue;

@interface XCWorkQueueOperation : XCOperation
{
    NSMutableArray *_workQueueList;
    id <XCWorkQueueOperationDelegates> _delegate;
    BOOL _reallyRunCommands;
    BOOL _lookForPredictCompFiles;
    unsigned long long _failureLimit;
    NSNumber *_uniqueId;
    BOOL _keepTimingData;
    unsigned long long _maxNumSubprocesses;
    unsigned long long _defaultNumSubprocesses;
    unsigned long long _curNumSubprocesses;
    int _wakeupPipe[2];
    NSMutableSet *_registeredWithCaches;
    NSOperationQueue *_operationQueue;
}

+ (id)operationArbitrator;
- (int)cleanupAfterRunning;
- (BOOL)_workQueueDidFinishBuilding:(id)arg1 resultCode:(int)arg2;
- (void)workQueueOperationDidFinishBuildingWithResultCode:(int)arg1;
- (int)runOperation;
- (int)setupBeforeRunning;
- (BOOL)workQueue:(id)arg1 didEndWithSuccessCount:(unsigned long long)arg2 failureCount:(unsigned long long)arg3 resultCode:(int)arg4;
- (void)workQueue:(id)arg1 reportStatus:(id)arg2 andPercentComplete:(double)arg3;
- (void)unregisterFromDerivedFileCaches;
- (void)registerWithDerivedFileCache:(id)arg1;
- (id)commandForTag:(long long)arg1;
- (id)uniqueId;
- (void)setDelegate:(id)arg1;
- (id)delegate;
- (id)operationQueue;
- (BOOL)commandsShouldPropagateCachedOutputs;
- (unsigned long long)currentNumberOfSubprocesses;
- (int)wakeupFileDescriptor;
- (void)cancel;
- (void)setFailureLimit:(unsigned long long)arg1;
- (unsigned long long)failureLimit;
- (void)setLooksForPredictiveCompilationFile:(unsigned long long)arg1;
- (BOOL)looksForPredictiveCompilationFiles;
- (void)setReallyRunsCommands:(unsigned long long)arg1;
- (BOOL)reallyRunsCommands;
- (void)setMaximumNumberOfSubprocesses:(unsigned long long)arg1;
- (unsigned long long)maximumNumberOfSubprocesses;
- (unsigned long long)numberOfWaitingCommands;
- (void)addWorkQueue:(id)arg1;
- (id)workQueueList;
- (void)finalize;
- (void)dealloc;
- (id)initWithIdentifier:(id)arg1;

@end

