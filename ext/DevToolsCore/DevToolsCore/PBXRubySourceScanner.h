//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/PBXSourceScanner.h>

@interface PBXRubySourceScanner : PBXSourceScanner
{
    long long _def;
    long long _class;
    long long _end;
    long long _module;
    long long _if;
    long long _unless;
    long long _while;
    long long _until;
    long long _for;
    long long _begin;
    long long _ensure;
    long long _do;
    long long _case;
}

- (id)parse;
- (void)initInterestingSymbols;

@end
