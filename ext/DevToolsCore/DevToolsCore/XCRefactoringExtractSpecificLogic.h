//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <DevToolsCore/XCRefactoringTransformationSpecificLogic.h>

@interface XCRefactoringExtractSpecificLogic : XCRefactoringTransformationSpecificLogic
{
}

- (id)localizedSnapshotTitle:(id)arg1;
- (id)transformParamDict:(id)arg1;
- (id)postInitialFileInfo:(id)arg1 newSelectionLineInfo:(struct _XCRefactoringLineInfo *)arg2 error:(id *)arg3;
- (BOOL)getClass:(Class *)arg1 declaration:(id *)arg2 fromASTNode:(id)arg3 mainThreadArguments:(id)arg4 error:(id *)arg5;
- (BOOL)parseUnsavedFiles:(id)arg1;
- (id)preliminaryRelatedNames:(id)arg1;
- (id)_extractToInfoFromUserInput:(id)arg1;

@end

