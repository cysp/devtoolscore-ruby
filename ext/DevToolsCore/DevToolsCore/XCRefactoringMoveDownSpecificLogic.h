//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCRefactoringTransformationSpecificLogic.h>

@class NSArray;

@interface XCRefactoringMoveDownSpecificLogic : XCRefactoringTransformationSpecificLogic
{
    NSArray *_nibProblems;
}

- (void)dealloc;
- (id)localizedSnapshotTitle:(id)arg1;
- (BOOL)modifyProblems:(id)arg1 parseThreadArguments:(id)arg2 error:(id *)arg3;
- (id)transformParamDict:(id)arg1;
- (BOOL)getClass:(Class *)arg1 declaration:(id *)arg2 fromASTNode:(id)arg3 mainThreadArguments:(id)arg4 error:(id *)arg5;
- (BOOL)userInputIsAvailable:(id)arg1 error:(id *)arg2;
- (id)preliminaryRelatedNames:(id)arg1;
- (id)setUpInfo:(id)arg1;
- (BOOL)mainThreadArgumentsAreAvailable:(id)arg1 error:(id *)arg2;
- (void)_releaseObjectsForNewPreview;

@end
