//
// Created by JS on 07/10/14.
// Copyright (c) 2014 TappyTaps. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AEAudioController;

typedef enum VoiceLevelAlgorithm  {
    kVoiceLevelAlgorithmNormal,
    kVoiceLevelSlowDown
} VoiceLevelAlgorithm;

@protocol VoiceLevelNotifierDelegate
    -(void)updateFromVoiceNotifier:(float)level;
@end

@interface VoiceLevelNotifier : NSObject

@property (nonatomic, strong) AEAudioController *audioController;
@property (weak) NSObject<VoiceLevelNotifierDelegate> *voiceLevelDelegate;
@property (weak) VoiceLevelNotifier* weakSelf;
@property float currentVoiceLevel;
@property VoiceLevelAlgorithm algorithm;

- (void)startMonitoring;
- (void)stopMonitoring;
@end