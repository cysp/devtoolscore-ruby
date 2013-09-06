//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCPropertyDomainSpecification.h>

@class XCToolSpecification_ivars;

@interface XCCommandLineToolSpecification : XCPropertyDomainSpecification
{
    XCToolSpecification_ivars *_tsIvars;
    id RESERVED;
}

+ (id)unionedDefaultValuesForAllPropertiesForAllToolsInDomain:(id)arg1;
+ (id)specificationRegistryName;
+ (id)specificationTypePathExtensions;
+ (id)localizedSpecificationTypeName;
+ (id)specificationType;
+ (Class)specificationTypeBaseClass;
- (id)instantiatedCommandResultsPostprocessorForCommand:(id)arg1;
- (unsigned long long)concurrentExecutionCountInTargetBuildContext:(id)arg1;
- (id)createCommandsforInputs:(id)arg1 inBuildContext:(id)arg2;
- (void)editArgumentsForCommand:(id)arg1 inBuildContext:(id)arg2;
- (id)doSpecialDependencySetupForCommand:(id)arg1 withInputNodes:(id)arg2 inBuildContext:(id)arg3;
- (id)outputPathFromInputNodes:(id)arg1 inBuildContext:(id)arg2;
- (id)executablePathInTargetBuildContext:(id)arg1;
- (void)checkDeploymentTargetAgainstSDKInTargetBuildContext:(id)arg1;
- (void)_addNameToDefaultValueMappingsToMutableDictionary:(id)arg1;
- (id)identifiersOfBuildPhasesForWhichToSynthesizeBuildRules;
- (BOOL)shouldSynthesizeGlobalBuildRule;
- (id)instantiatedCommandOutputParserWithLogSectionRecorder:(id)arg1;
- (id)arrayByRemovingArgumentsNotAffectingOutputFileFromArray:(id)arg1;
- (BOOL)areOutputFilesAffectedByEnvironmentVariable:(id)arg1;
- (BOOL)areOutputFilesAffectedByCommandLineArgument:(id)arg1;
- (id)commandLineForAutogeneratedOptionsInTargetBuildContext:(id)arg1;
- (id)_expandedValueForCommandLineBuildOptionNamed:(id)arg1 inBuildContext:(id)arg2;
- (id)hashStringForCommandLineComponents:(id)arg1 inputFilePaths:(id)arg2 inTargetBuildContext:(id)arg3;
- (id)requiredComponents;
- (void)setDefaultDeploymentTarget:(id)arg1 forName:(id)arg2;
- (id)defaultDeploymentTargetNamed:(id)arg1;
- (id)commandOutputParserClassesOrParseRules;
- (Class)commandInvocationClass;
- (BOOL)outputsAreProducts;
- (id)outputPaths;
- (BOOL)supportsArchitecture:(id)arg1;
- (BOOL)acceptsInputFileType:(id)arg1;
- (id)supportedArchitectures;
- (id)inputFileTypes;
- (id)ruleLineTemplate;
- (id)fallbackToolSpecificationsForDomain:(id)arg1;
- (id)path;
- (id)name;
- (void)dealloc;
- (id)initWithPropertyListDictionary:(id)arg1 inDomain:(id)arg2;

@end

