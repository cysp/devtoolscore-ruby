//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/PBXContainer.h>

@interface PBXFramework : PBXContainer
{
    BOOL _needsToValidateChildren;
}

+ (id)frameworkForFileReference:(id)arg1;
+ (id)frameworkForPath:(id)arg1;
+ (id)frameworkForPath:(id)arg1 withResolvedPath:(id)arg2;
- (id)absolutePathsOfPrivateHeaderFiles;
- (id)absolutePathsOfPublicHeaderFiles;
- (id)_absolutePathsOfFilesInSubdirectoryNamed:(id)arg1;
- (void)invalidateAbsolutePathCache;
- (void)validateChildren;
- (id)rootGroup;

@end

