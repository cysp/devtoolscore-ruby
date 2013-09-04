//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class XCRefactoringFileChangeSet, XCRefactoringFileLocation;

@interface XCRefactoringFileChange : NSObject
{
    XCRefactoringFileChangeSet *_fileChangeSet;
    XCRefactoringFileLocation *_fileLocation;
    BOOL _shouldBeApplied;
}

- (BOOL)isEqualToFileChange:(id)arg1;
- (BOOL)applyChange:(void *)arg1 error:(id *)arg2;
- (void)setShouldBeApplied:(BOOL)arg1;
- (BOOL)shouldBeApplied;
- (id)fileLocation;
- (id)fileChangeSet;
- (void)dealloc;
- (id)initWithFileChangeSet:(id)arg1 fileLocation:(id)arg2;

@end

