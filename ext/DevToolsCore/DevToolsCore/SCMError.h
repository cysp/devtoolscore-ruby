//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/SCMActivity.h>

@interface SCMError : SCMActivity
{
    int _type;
}

+ (id)errorWithType:(int)arg1 message:(id)arg2;
@property int type; // @synthesize type=_type;
- (id)description;
- (void)addXMLAttributes:(id)arg1;
- (id)createXMLElement;
- (void)dealloc;
- (id)initWithType:(int)arg1 message:(id)arg2;

@end

