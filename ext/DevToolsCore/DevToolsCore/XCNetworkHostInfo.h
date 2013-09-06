//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class NSMutableArray, NSString;

@interface XCNetworkHostInfo : NSObject
{
    NSMutableArray *_clients;
    struct __SCNetworkReachability *_reachabilityTarget;
    struct {
        long long version;
        void *info;
        void *retain;
        void *release;
        void *copyDescription;
    } _context;
    NSString *_networkHostName;
    BOOL _online;
}

+ (id)hostWithName:(id)arg1;
- (void)networkHostOnlineStatusChanged:(unsigned int)arg1;
- (BOOL)online;
- (BOOL)removeClient:(id)arg1;
- (void)addClient:(id)arg1;
- (void)disconnect;
- (id)clients;
- (void)finalize;
- (void)dealloc;
- (id)initWithReachabilityRef:(struct __SCNetworkReachability *)arg1 networkHostName:(id)arg2;

@end

