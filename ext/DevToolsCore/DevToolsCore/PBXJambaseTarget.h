//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/PBXTarget.h>

@interface PBXJambaseTarget : PBXTarget
{
}

+ (id)jambasePlatformFilePath;
+ (id)jambasePath;
+ (id)buildSystemDefaultBuildSettings_asPropertyValues;
+ (id)buildSystemDefaultBuildSettings;
- (BOOL)buildSettingsDictionaryShouldExtractQuotedBuildSettingsWhenSplitting:(id)arg1;
- (id)commandsForCleaningInBuildContext:(id)arg1;
- (BOOL)shouldWriteAuxiliaryFilesForBuildAction:(id)arg1;
- (Class)dependencyGraphSnapshotClass;

@end
