//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

@protocol XCSCMRequestDelegate
- (void)request:(id)arg1 reportedObject:(id)arg2 forKey:(id)arg3 forReference:(id)arg4;
- (void)request:(id)arg1 wasSuspendedWithCode:(id)arg2 message:(id)arg3;
- (void)request:(id)arg1 reportedError:(id)arg2;
- (void)request:(id)arg1 reportedMessage:(id)arg2;
- (void)request:(id)arg1 hadProgress:(long long)arg2 comment:(id)arg3;
- (void)request:(id)arg1 startedOperation:(id)arg2;
@end

