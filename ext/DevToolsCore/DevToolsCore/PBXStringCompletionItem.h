//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

#import "PBXCompletionItem.h"

@class NSImage, NSString;

@interface PBXStringCompletionItem : NSObject <PBXCompletionItem>
{
    NSString *_name;
    NSString *_localizedName;
    long long _priority;
    NSImage *_icon;
}

- (void)setPriority:(long long)arg1;
- (long long)priority;
- (void)setLocalizedName:(id)arg1;
- (id)localizedName;
- (void)setIcon:(id)arg1;
- (id)icon;
- (id)description;
- (id)descriptionText;
- (id)completionText;
- (id)displayType;
- (id)displayText;
- (id)name;
- (unsigned long long)hash;
- (BOOL)isEqual:(id)arg1;
- (void)dealloc;
- (id)initWithString:(id)arg1;

@end

