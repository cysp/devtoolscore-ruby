//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSMutableData.h"

@interface NSMutableData (ConvenienceAppendMethods)
- (void)appendHexadecimalRepresentationOfBytes:(const char *)arg1 length:(unsigned long long)arg2;
- (void)appendUnicodeCharactersAsQuotedUTF8:(const unsigned short *)arg1 length:(unsigned long long)arg2 quoteOnlyIfNeeded:(BOOL)arg3 quoteTabsAndEOLs:(BOOL)arg4;
- (void)appendStringAsUTF8:(id)arg1;
- (void)appendUnicodeCharactersAsUTF8:(const unsigned short *)arg1 length:(unsigned long long)arg2;
- (void)appendUTF8String:(const char *)arg1;
- (void)appendIndentation:(unsigned long long)arg1;
@end

