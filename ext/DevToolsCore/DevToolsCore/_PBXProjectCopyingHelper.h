//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSString;

@interface _PBXProjectCopyingHelper : NSObject
{
    NSString *_sourcePath;
    NSString *_destinationPath;
}

- (BOOL)performCopy;
- (id)destinationPath:(id)arg1 forSourcePath:(id)arg2 ofType:(id)arg3 forFileManager:(id)arg4;
- (void)dealloc;
- (id)initWithSourcePath:(id)arg1 destinationPath:(id)arg2;

@end
