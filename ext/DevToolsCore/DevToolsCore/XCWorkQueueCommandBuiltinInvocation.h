//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Jan  8 2013 19:10:45).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

//
// SDK Root: /Applications/Xcode5-DP6.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
//

#import <DevToolsCore/XCWorkQueueCommandInvocation.h>

@class NSArray, NSDictionary, NSInvocationOperation, NSString;

@interface XCWorkQueueCommandBuiltinInvocation : XCWorkQueueCommandInvocation
{
    NSArray *_arguments;
    NSDictionary *_environment;
    NSString *_workingDirPath;
    BOOL _isRunning;
    int _exitCode;
    NSInvocationOperation *_operation;
    int _outputFD;
    int _inputFD;
    int _taskOutputFD;
    int _taskInputFD;
}

- (int)emitMessageWithFormat:(id)arg1;
- (int)emitMessage:(id)arg1;
- (int)runTaskWithArguments:(id)arg1 environment:(id)arg2 workingDirectoryPath:(id)arg3;
- (BOOL)isCancelled;
- (void)performTaskOperationWithContext:(id)arg1;
- (BOOL)_startBuiltinTaskWithArguments:(id)arg1 environment:(id)arg2 workingDirectoryPath:(id)arg3;
- (void)cancel;
- (void)stopJob;
- (void)handleInputFileDescriptorActivity;
- (void)handleOutputFileDescriptorActivity;
- (void)handleEndOfOutput;
- (void)handleOutputBytes:(const char *)arg1 length:(unsigned long long)arg2;
- (BOOL)startRunning;
- (int)realExitCode;
- (int)exitCode;
- (BOOL)isRunning;
- (int)inputFileDescriptor;
- (int)outputFileDescriptor;
- (void)createOutputStreamIfNeeded;
- (void)dealloc;
- (id)initWithSlotNumber:(unsigned long long)arg1 workQueueOperation:(id)arg2 workQueueCommand:(id)arg3 arguments:(id)arg4 environment:(id)arg5 workingDirectoryPath:(id)arg6;

@end

