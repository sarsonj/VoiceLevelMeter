//
// Created by JS on 07/10/14.
// Copyright (c) 2014 TappyTaps. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AEAudioController;


@protocol VoiceLevelNotifierDelegate
    -(void)updateFromVoiceNotifier:(float)level;
@end

@interface VoiceLevelNotifier : NSObject

@property (nonatomic, strong) AEAudioController *audioController;
@property (weak) NSObject<VoiceLevelNotifierDelegate> *voiceLevelDelegate;
@property (weak) VoiceLevelNotifier* weakSelf;

- (void)startMonitoring;
- (void)stopMonitoring;
@end