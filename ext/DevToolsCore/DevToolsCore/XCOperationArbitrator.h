//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSMutableArray;

@interface XCOperationArbitrator : NSObject
{
    NSMutableArray *_runningOperations;
    NSMutableArray *_pendingOperations;
}

+ (id)sharedOperationArbitrator;
- (void)operationDidStop:(id)arg1;
- (void)unregisterPendingOperation:(id)arg1;
- (void)registerPendingOperation:(id)arg1;
- (void)registerRunningOperation:(id)arg1;
- (void)dealloc;
- (id)init;

@end

