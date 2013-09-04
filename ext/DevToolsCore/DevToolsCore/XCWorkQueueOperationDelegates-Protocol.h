//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@protocol XCWorkQueueOperationDelegates <NSObject>
- (BOOL)workQueueOperationCommandsShouldPropagateCachedOutputs:(id)arg1;
- (void)workQueueOperation:(id)arg1 didReportStatus:(id)arg2 andPercentComplete:(double)arg3;
- (id)workQueueOperationUniqueId;
- (BOOL)addWorkQueueForNextReadyBuildableToWorkQueueOperation:(id)arg1;
- (BOOL)workQueueOperation:(id)arg1 buildable:(id)arg2 didEndWithSuccessCount:(unsigned long long)arg3 failureCount:(unsigned long long)arg4 resultCode:(int)arg5;
- (void)workQueueOperationDidWaitForCommandActivity:(id)arg1;
- (void)workQueueOperationWillWaitForCommandActivity:(id)arg1;
- (void)workQueueOperation:(id)arg1 buildable:(id)arg2 didActivateCommand:(id)arg3;
- (void)workQueueOperation:(id)arg1 buildable:(id)arg2 willActivateNextProcessableCommandIfAnyOnWorkQueue:(id)arg3;
@end
