//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/PBXProject.h>

@class NSMutableArray, NSMutableDictionary, XCProductTypeSpecification;

@interface PBXStandaloneTarget : PBXProject
{
    XCProductTypeSpecification *_productType;
    NSMutableDictionary *_buildProperties;
    NSMutableArray *_buildRules;
}

+ (id)archivableRelationships;
+ (id)archivableAttributes;
- (void)awakeFromPListUnarchiver:(id)arg1;
- (void)_setProductType:(id)arg1;
- (id)_productType;
- (void)dealloc;
- (id)init;

@end
