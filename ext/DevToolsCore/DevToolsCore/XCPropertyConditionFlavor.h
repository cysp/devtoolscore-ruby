//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCSpecification.h>

@interface XCPropertyConditionFlavor : XCSpecification
{
    unsigned long long _precedence;
}

+ (id)defaultConditionFlavors;
+ (id)specificationRegistryName;
+ (id)localizedSpecificationTypeName;
+ (id)specificationType;
+ (Class)specificationTypeBaseClass;
- (long long)compare:(id)arg1;
- (unsigned long long)precedence;
- (void)dealloc;
- (id)initWithPropertyListDictionary:(id)arg1 inDomain:(id)arg2;

@end
