//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/PBXSymbol.h>

#import "PBXSignatureSymbol.h"

@class NSArray, NSString;

@interface PBXFunctionSymbol : PBXSymbol <PBXSignatureSymbol>
{
    NSString *_cachedInvocation;
    NSString *_cachedUniqueName;
    NSArray *_cachedParameters;
}

+ (BOOL)canRepresentSymbolType:(int)arg1;
- (id)helpMarkerSymbolType;
- (id)displayNameIncludingClassInfo:(BOOL)arg1;
- (id)uniqueName;
- (id)invocationStringIncludeTarget:(BOOL)arg1;
- (id)codeCompletionInvocationString;
- (id)invocationString;
- (id)declarationString;
- (id)parameters;
- (void)dealloc;

@end
