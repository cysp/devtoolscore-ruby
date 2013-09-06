//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import "NSObject.h"

@class NSMutableData, NSMutableString, NSString, XCPosixTask, XCPosixTaskLaunchInfo;

@interface SCMTask : NSObject
{
    XCPosixTaskLaunchInfo *_taskInfo;
    XCPosixTask *_task;
    NSString *_description;
    BOOL _taskFinished;
    BOOL _outputDataFinished;
    BOOL _errorDataFinished;
    BOOL _handleOutput;
    NSMutableData *_errorDataBuffer;
    NSMutableData *_outputDataBuffer;
    NSMutableString *_errorStringBuffer;
    NSMutableString *_outputStringBuffer;
    NSMutableString *_errorLineBuffer;
    NSMutableString *_outputLineBuffer;
    SEL _completionSelector;
    id _completionTarget;
    SEL _outputParserSelector;
    id _outputParser;
    id _contextInfo;
    int _terminationStatus;
}

@property int terminationStatus; // @synthesize terminationStatus=_terminationStatus;
@property(retain) id contextInfo; // @synthesize contextInfo=_contextInfo;
@property(retain) id outputParser; // @synthesize outputParser=_outputParser;
@property SEL outputParserSelector; // @synthesize outputParserSelector=_outputParserSelector;
@property(retain) id completionTarget; // @synthesize completionTarget=_completionTarget;
@property SEL completionSelector; // @synthesize completionSelector=_completionSelector;
@property(retain) NSMutableString *outputLineBuffer; // @synthesize outputLineBuffer=_outputLineBuffer;
@property(retain) NSMutableString *errorLineBuffer; // @synthesize errorLineBuffer=_errorLineBuffer;
@property(retain) NSMutableData *outputDataBuffer; // @synthesize outputDataBuffer=_outputDataBuffer;
@property(retain) NSMutableData *errorDataBuffer; // @synthesize errorDataBuffer=_errorDataBuffer;
@property(retain) NSMutableString *outputStringBuffer; // @synthesize outputStringBuffer=_outputStringBuffer;
@property(retain) NSMutableString *errorStringBuffer; // @synthesize errorStringBuffer=_errorStringBuffer;
@property BOOL handleOutput; // @synthesize handleOutput=_handleOutput;
@property BOOL errorDataFinished; // @synthesize errorDataFinished=_errorDataFinished;
@property BOOL outputDataFinished; // @synthesize outputDataFinished=_outputDataFinished;
@property BOOL taskFinished; // @synthesize taskFinished=_taskFinished;
@property(copy) NSString *description; // @synthesize description=_description;
@property(retain) XCPosixTask *task; // @synthesize task=_task;
- (void)taskOutputComplete:(id)arg1;
- (void)task:(id)arg1 receivedStderrObject:(id)arg2;
- (void)task:(id)arg1 receivedStdoutObject:(id)arg2;
- (void)task:(id)arg1 hasSpawnStatus:(int)arg2;
- (void)taskDidTerminate:(id)arg1;
- (id)readErrorUntilString:(id)arg1 timeout:(long long)arg2;
- (id)readOutputUntilString:(id)arg1 timeout:(long long)arg2;
- (void)gotOutputData:(id)arg1;
- (void)gotErrorData:(id)arg1;
- (void)handleData:(id)arg1 withBuffer:(id)arg2 lineBuffer:(id)arg3 isStdErr:(BOOL)arg4;
@property(readonly) NSString *errorString;
@property(readonly) NSString *outputString;
- (id)waitForOutputData;
- (id)NSDataToNSString:(id)arg1;
- (void)waitUntilFinished;
- (BOOL)launch;
- (BOOL)allFinished;
- (id)readFileHandle:(id)arg1 untilString:(id)arg2 timeout:(long long)arg3;
- (id)readFileDescriptor:(long long)arg1 untilString:(id)arg2 timeout:(long long)arg3;
- (id)readFileDescriptor:(long long)arg1;
- (void)writeData:(id)arg1;
- (void)setCompletionTarget:(id)arg1 selector:(SEL)arg2;
- (void)disconnectAndReleaseIfFinished;
- (void)shouldCollect;
- (id)arguments;
- (void)dealloc;
- (id)initWithLaunchPath:(id)arg1 directoryPath:(id)arg2 arguments:(id)arg3 environment:(id)arg4 outputParser:(id)arg5 outputParserSelector:(SEL)arg6 contextInfo:(id)arg7;
- (id)initWithLaunchPath:(id)arg1 directoryPath:(id)arg2 arguments:(id)arg3 environment:(id)arg4;
- (id)initWithLaunchPath:(id)arg1 directoryPath:(id)arg2 arguments:(id)arg3 environment:(id)arg4 handleOutput:(BOOL)arg5;

@end

