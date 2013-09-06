//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class NSMutableSet, NSSet;

@interface XCRemoteComputerManager : NSObject
{
    NSMutableSet *_remoteComputers;
}

+ (Class)remoteComputerClassForPlatform:(id)arg1;
+ (id)remoteComputerClasses;
+ (Class)_remoteComputerClassForExtension:(id)arg1;
+ (id)remoteComputerExtensionForPlatform:(id)arg1;
+ (id)remoteComputerExtensions;
+ (id)remoteComputerExtensionPoint;
+ (BOOL)shouldApplicationTerminate;
+ (id)sharedRemoteComputerManager;
+ (void)allowRemoteComputerAccess:(BOOL)arg1;
@property(copy) NSSet *remoteComputers;
- (void)removeRemoteComputersObject:(id)arg1;
- (void)addRemoteComputersObject:(id)arg1;
@property(readonly) NSMutableSet *mutableRemoteComputers;
- (void)_writeToDefaults;
- (void)forgetDevice:(id)arg1;
- (void)deviceDisconnected:(id)arg1;
- (void)_deviceDisconnected:(id)arg1 forget:(BOOL)arg2;
- (void)deviceConnected:(id)arg1;
- (id)remoteComputerWithDeviceIdentifier:(id)arg1;
- (id)usableRemoteComputersForPlatform:(id)arg1 ofDeviceFamily:(id)arg2;
- (id)remoteComputersForPlatform:(id)arg1 matchingPredicate:(id)arg2;
- (id)remoteComputersForPlatform:(id)arg1;
- (id)remoteComputerMatchingPredicate:(id)arg1;
- (id)remoteComputersMatchingPredicate:(id)arg1;
- (void)dealloc;
- (id)init;

@end

