//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class ASTNode, NSArray, NSDictionary, NSMutableDictionary, NSMutableSet, NSSet, NSString, Transform, TransformInstance, XCRefactoringMainThreadArguments, XCRefactoringParseThreadArguments, XCRefactoringParser;

@interface XCRefactoringTransformation : NSObject
{
    NSDictionary *_initialInput;
    NSString *_projectResolvedAbsolutePath;
    NSDictionary *_userInput;
    NSMutableDictionary *_specificLogics;
    NSString *_transformKey;
    NSDictionary *_editedFilePathsAndContents;
    BOOL _isParsingInitialFile;
    ASTNode *_selectionNode;
    NSArray *_preliminaryRelatedNames;
    NSSet *_preliminaryAnalyzableFiles;
    NSMutableDictionary *_cachedBuildSettingsForCompilationUnits;
    NSString *_initialFileCompilationUnit;
    XCRefactoringParser *_parser;
    NSMutableSet *_parsedFiles;
    NSMutableDictionary *_parsedFileBuildSettingsProblems;
    long long _stage;
    NSArray *_parserBasedRelatedNames;
    NSArray *_parserBasedAnalyzableFiles;
    Transform *_transform;
    TransformInstance *_transformInstance;
    unsigned long long _index;
    BOOL _stopParsing;
    NSMutableDictionary *_nonTextChangeSets;
    NSMutableDictionary *_filePathsAndFileContents;
    BOOL _shouldCreateFileChangeSetForNibFile;
    BOOL _shouldCreateFileChangeSetForDataModelFile;
    XCRefactoringMainThreadArguments *_mainThreadArguments;
    XCRefactoringParseThreadArguments *_parseThreadArguments;
    NSArray *_cppFileProblems;
    int _useIBAgentStatus;
}

- (void)dealloc;
- (id)init;
- (id)localizedSnapshotTitle;
- (id)selectionSymbolInfo;
- (id)filePath;
- (id)dataForFilePath:(id)arg1;
- (id)memorySourceForFile:(const char *)arg1;
- (void)stopParsing;
- (BOOL)assessFileSystemStatusOfFileChangeSets:(id)arg1 outAppliableFileChangeSets:(id *)arg2 outFileSystemProblems:(id *)arg3 outSCMEditFilePaths:(id *)arg4 outError:(id *)arg5;
- (id)postInitialFileInfoForTransformKey:(id)arg1 outNewSelectionLineInfo:(struct _XCRefactoringLineInfo *)arg2 outError:(id *)arg3;
- (BOOL)performThreadSafeParsingOnInitialFile:(id *)arg1;
- (id)setUpInfoForTransformKey:(id)arg1 outError:(id *)arg2;
- (BOOL)performThreadSafeRefactoringOn:(id)arg1 outNextFile:(id *)arg2 outCompleted:(float *)arg3 outFileChangeSets:(id *)arg4 outProblems:(id *)arg5 outError:(id *)arg6;
- (BOOL)processUserInput:(id)arg1 transformKey:(id)arg2 outInitialFiles:(id *)arg3 outError:(id *)arg4;
- (BOOL)processInitialInput:(id)arg1 editedFileContents:(id)arg2 outError:(id *)arg3;
- (BOOL)_createSelectionNode:(id *)arg1;
- (BOOL)_postParseError:(id *)arg1;
- (BOOL)_createTransform:(id *)arg1;
- (BOOL)_createAndCheckTransformWithClass:(Class)arg1 declaration:(id)arg2 paramDict:(id)arg3 outError:(id *)arg4;
- (BOOL)_createParserBasedData:(id *)arg1;
- (void)_createParserBasedAnalyzableFiles:(id)arg1;
- (void)_createTransformWithClass:(Class)arg1 declaration:(id)arg2 paramDict:(id)arg3;
- (float)_completed;
- (id)_refactoringProblems:(id *)arg1;
- (id)_refactoringFileChangeSets:(id *)arg1;
- (id)_scheduleNextFile:(id)arg1;
- (void)_addFileProblemWithType:(int)arg1 filePath:(id)arg2 toArray:(id)arg3 format:(id)arg4;
- (BOOL)_calculateFromRelatedNames:(id)arg1 allFiles:(id *)arg2 analyzableFiles:(id *)arg3 buildSettings:(id *)arg4 error:(id *)arg5;
- (id)_buildSettingsForCompilationUnits:(id)arg1;
- (BOOL)_hasUserSelection;
- (void)_releaseObjectsForNewTransformation;
- (id)_specificLogicForTransformKey:(id)arg1 error:(id *)arg2;
- (BOOL)_analyzeFileAtIndex:(long long)arg1 outError:(id *)arg2;
- (BOOL)_analyzeCompilationUnitFile:(id)arg1 outError:(id *)arg2;
- (BOOL)_parseOneCompilationUnit:(id)arg1 buildSettings:(id)arg2 outError:(id *)arg3;
- (BOOL)_shouldCreateFileChangeSetForDataModelFile:(id)arg1;
- (BOOL)_shouldCreateFileChangeSetForNibFile:(id)arg1;
- (void)_analyzeSymbolsOnMainThread:(id)arg1;
- (id)_symbolsWithName:(id)arg1 ofType:(int)arg2 inFilePath:(id)arg3;
- (id)_ibtoolAgentString;
- (BOOL)_mayRenameKVCCoreDataMembers;
- (id)_renameNewName;
- (id)_renameOldName;

@end

