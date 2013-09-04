//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSMutableData;

@interface PBXCStringStorage : NSObject
{
    NSMutableData *_controlData;
    struct _pbxcstringstorageheader {
        unsigned int _field1;
        unsigned short _field2;
        struct {
            unsigned int :7;
            unsigned int :1;
            unsigned int :8;
        } _field3;
        unsigned int _field4;
        unsigned int _field5;
        unsigned int _field6;
    } *_header;
    struct _PBXCStringStorageHashBucket *_buckets;
    unsigned long long _numFreeRangeStructs;
    struct _PBXCStringStorageFreeRange *_freeRangeStructs;
    unsigned long long _firstFreeRangeIdx;
    NSMutableData *_cStringData;
    char *_cStringDataPtr;
    char *_cStringDataEnd;
    void *_hashFunc;
    void *_equalFunc;
}

- (void)applyFunction:(void *)arg1 context:(void *)arg2;
- (unsigned long long *)offsetsOfStringsMatching:(const char *)arg1 ignoreCase:(BOOL)arg2 matchStyle:(int)arg3;
- (id)description;
- (BOOL)writeDataToFile:(id)arg1 queue:(struct dispatch_queue_s *)arg2;
- (unsigned int)unsignedIntValueAtOffset:(unsigned long long)arg1;
- (void)setUnsignedIntValue:(unsigned int)arg1 atOffset:(unsigned long long)arg2;
- (unsigned char)byteValueAtOffset:(unsigned long long)arg1;
- (void)setByteValue:(unsigned char)arg1 atOffset:(unsigned long long)arg2;
- (void)removeCString:(const char *)arg1;
- (unsigned long long)addCString:(const char *)arg1;
- (const char *)cStringAtOffset:(unsigned long long)arg1;
- (unsigned long long)offsetOfCString:(const char *)arg1;
- (id)cStringData;
- (unsigned long long)numberOfCStrings;
- (void)dealloc;
- (id)init;
- (id)initWithContentsOfFile:(id)arg1;
- (id)initWithCapacity:(unsigned long long)arg1;
- (id)initWithCapacity:(unsigned long long)arg1 caseSensitive:(BOOL)arg2;
- (id)initWithCapacity:(unsigned long long)arg1 caseSensitive:(BOOL)arg2 prepaddingSize:(unsigned long long)arg3;

@end

