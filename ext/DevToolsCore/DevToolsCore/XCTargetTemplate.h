//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class NSString, PBXProject;

@interface XCTargetTemplate : NSObject
{
    NSString *_templatePListPath;
    NSString *_templateName;
    PBXProject *_project;
    Class _templateClass;
    NSString *_templateDescription;
    BOOL _hasCachedPListInfo;
    BOOL _isPListBasedTemplate;
}

- (void)dealloc;
- (id)containingProject;
- (id)templateDescription;
- (Class)templateClass;
- (id)categorizedTemplateName;
- (id)_templateDictionaryForTargetName:(id)arg1;
- (void)cacheTemplateInfoFromPList;
- (id)_plistDictForTargetName:(id)arg1;
- (id)targetWithName:(id)arg1;
- (id)templatePListPath;
- (id)init;
- (id)initWithTargetClass:(Class)arg1 name:(id)arg2 containingProject:(id)arg3;
- (id)initWithTemplatePListPath:(id)arg1 name:(id)arg2 containingProject:(id)arg3;
- (id)name;
- (id)objectSpecifier;

@end

