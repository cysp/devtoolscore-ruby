//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSMutableArray;

@interface PBXCCSymbolTable : NSObject
{
    NSMutableArray *scopes;
}

- (id)enclosingContainer;
- (id)scopes;
- (id)allSymbols;
- (id)importedTypeWithName:(id)arg1;
- (id)getSymbolWithName:(id)arg1;
- (void)addSymbol:(id)arg1;
- (void)popScope;
- (void)pushScope;
- (void)pushScope:(id)arg1;
- (id)description;
- (void)dealloc;
- (id)init;

@end
