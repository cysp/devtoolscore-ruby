//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCRefactoringFileChange.h>

@class NSMutableDictionary;

@interface XCRefactoringNibFileChange : XCRefactoringFileChange
{
    NSMutableDictionary *_commands;
    long long _objectID;
    NSMutableDictionary *_properties;
}

+ (id)commandString;
- (BOOL)applyChange:(void *)arg1 error:(id *)arg2;
- (void)_removePropertyForKey:(id)arg1;
- (id)_propertyForKey:(id)arg1;
- (void)_setProperty:(id)arg1 forKey:(id)arg2;
- (id)propertyDictionary;
- (long long)objectID;
- (void)setObjectID:(long long)arg1;
- (void)_removeCommandForKey:(id)arg1;
- (id)_commandForKey:(id)arg1;
- (void)_setCommand:(id)arg1 forKey:(id)arg2;
- (id)commandDictionary;
- (void)dealloc;
- (id)initWithFileChangeSet:(id)arg1 fileLocation:(id)arg2;

@end

