//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

#import "NSCopying.h"

@interface XCAttributeRunBase : NSObject <NSCopying>
{
    unsigned long long totalNodeLength;
    unsigned long long entryCount;
    unsigned long long cachedEntry;
    unsigned long long cachedEntryOffset;
    struct _XCAttributeRunBaseFlags flags;
}

+ (void)initialize;
- (void)printStats;
- (void)gatherStats:(CDStruct_026f2692 *)arg1;
- (id)checkError:(id)arg1;
- (id)check;
- (id)check:(void *)arg1 incomingAttrsValid:(BOOL)arg2 outgoingAttrs:(void **)arg3 parent:(id)arg4;
- (void)dump;
- (void)dumpToFileHandle:(id)arg1 withOrigin:(unsigned long long)arg2 indent:(id)arg3;
- (void)_deleteRange:(struct _NSRange)arg1;
- (BOOL)_insertAttributes:(void *)arg1 range:(struct _NSRange)arg2;
- (id)split;
- (BOOL)_setAttributes:(void *)arg1 range:(struct _NSRange)arg2;
- (unsigned long long)length;
- (void *)attributesAtIndex:(unsigned long long)arg1 effectiveRange:(struct _NSRange *)arg2;
- (id)restoreForReplay:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)init;
- (id)initWithFlags:(struct _XCAttributeRunBaseFlags)arg1;

@end

