//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCPropertyDomainSpecification.h>

@class NSArray, NSDictionary, NSString;

@interface XCBuildPhaseSpecification : XCPropertyDomainSpecification
{
    NSString *_name;
    NSArray *_buildRules;
    NSDictionary *_buildSettings;
}

+ (id)specificationRegistryName;
+ (id)specificationTypePathExtensions;
+ (id)localizedSpecificationTypeName;
+ (id)specificationType;
+ (Class)specificationTypeBaseClass;
- (id)buildSettings;
- (id)buildRules;
- (id)name;
- (void)dealloc;
- (id)initWithPropertyListDictionary:(id)arg1 inDomain:(id)arg2;

@end
