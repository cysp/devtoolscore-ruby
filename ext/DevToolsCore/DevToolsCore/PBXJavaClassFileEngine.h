//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/PBXIndexingEngine.h>

@class JKClassLibrary, NSMutableData, NSString;

@interface PBXJavaClassFileEngine : PBXIndexingEngine
{
    BOOL _stopped;
    NSMutableData *bufData;
    char *buf;
    JKClassLibrary *classLibrary;
    NSString *libraryName;
}

+ (id)fileListForFrameworkOrLibrary:(id)arg1 rootPackage:(id)arg2 includeInnerClasses:(BOOL)arg3;
+ (id)fileListForFrameworkOrLibrary:(id)arg1;
+ (void)addClassesFromPackage:(id)arg1 inLibrary:(id)arg2 includeInnerClasses:(BOOL)arg3 intoMutableArray:(id)arg4;
+ (id)indexableFileTypes;
- (void)stopIndexing;
- (void)indexFileAtAbsolutePath:(id)arg1 withSettings:(id)arg2;
- (BOOL)parseClassFile:(id)arg1;
- (void)releaseCachedData;
- (void)openClassLibrary:(id)arg1;
- (const char *)convertedName:(id)arg1;
- (void)dealloc;
- (id)initWithProjectIndex:(id)arg1;

@end

