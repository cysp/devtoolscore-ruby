//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/PBXReference.h>

@class PBXContainerItemProxy, PBXFileType;

@interface PBXReferenceProxy : PBXReference
{
    PBXContainerItemProxy *_remoteRef;
    BOOL _needsSync;
    PBXFileType *_fileType;
}

+ (id)archivableRelationships;
+ (id)archivableAttributes;
- (id)innerDescription;
- (void)awakeFromPListUnarchiver:(id)arg1;
- (void)writeToPListArchiver:(id)arg1;
- (void)_syncCachedValuesWithRemoteReferenceIfNeeded;
- (BOOL)needsSync;
- (void)setNeedsSync:(BOOL)arg1;
- (void)_setFileType:(id)arg1;
- (id)_fileType;
- (void)setIncludeInIndex:(long long)arg1;
- (BOOL)canSetIncludeInIndex;
- (BOOL)includeInIndex;
- (id)fileProperties;
- (void)setFileType:(id)arg1;
- (id)fileType;
- (id)destinationGroupForFilenames:(id)arg1;
- (id)destinationGroupForInsertion;
- (BOOL)changeSourceTree:(id)arg1;
- (BOOL)moveToNewPath:(id)arg1;
- (BOOL)copyToNewPath:(id)arg1;
- (BOOL)setPath:(id)arg1;
- (void)setPath:(id)arg1 andSourceTree:(id)arg2;
- (BOOL)fileExists;
- (id)absolutePathForDisplay;
- (id)buildProductRelativePath;
- (id)groupRelativePath;
- (id)projectRelativePath;
- (id)resolvedAbsoluteDirectory;
- (id)resolvedAbsolutePath;
- (id)absoluteDirectory;
- (id)absolutePathForConfigurationNamed:(id)arg1;
- (id)absolutePath;
- (id)path;
- (id)sourceTree;
- (BOOL)canSetName;
- (void)setName:(id)arg1;
- (id)name;
- (BOOL)allowsRemovalFromDisk;
- (BOOL)allowsEditing;
- (id)includingTargets;
- (id)producingTarget;
- (BOOL)deleteFromProjectAndDisk:(BOOL)arg1;
- (void)deleteFromDisk;
- (void)setContainer:(id)arg1;
- (id)realReference;
- (void)dealloc;
- (id)initRemoteProductReferenceWithPortal:(id)arg1 remoteGlobalIDString:(id)arg2 remoteInfo:(id)arg3;
- (id)initWithType:(int)arg1 portal:(id)arg2 remoteGlobalIDString:(id)arg3 remoteInfo:(id)arg4;

@end

