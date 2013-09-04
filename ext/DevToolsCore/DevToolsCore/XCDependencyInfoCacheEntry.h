//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class XCDependencyInfoCache, XCPath;

@interface XCDependencyInfoCacheEntry : NSObject
{
    XCPath *_path;
    CDStruct_7eef4560 _buildCmdInputSignature;
    CDStruct_7eef4560 _buildCmdConfigSignature;
    CDStruct_7eef4560 _contentSignature;
    unsigned int _fileSize;
    XCDependencyInfoCache *_cache;
    XCDependencyInfoCacheEntry *_prevMRUCacheEntry;
    XCDependencyInfoCacheEntry *_nextMRUCacheEntry;
}

- (void)writeToFILE:(struct __sFILE *)arg1;
- (id)initFromFILE:(struct __sFILE *)arg1;
- (void)setFileSize:(unsigned int)arg1;
- (unsigned int)fileSize;
- (void)setContentSignature:(CDStruct_7eef4560)arg1;
- (CDStruct_7eef4560)contentSignature;
- (void)setBuildCommandInputSignature:(CDStruct_7eef4560)arg1;
- (CDStruct_7eef4560)buildCommandInputSignature;
- (void)setBuildCommandConfigurationSignature:(CDStruct_7eef4560)arg1;
- (CDStruct_7eef4560)buildCommandConfigurationSignature;
- (id)description;
- (id)path;
- (void)dealloc;
- (id)init;
- (id)initWithPath:(id)arg1;

@end
