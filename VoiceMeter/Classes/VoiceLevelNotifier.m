//
// Created by JS on 07/10/14.
// Copyright (c) 2014 TappyTaps. All rights reserved.
//

#import "VoiceLevelNotifier.h"
#import "AEAudioController.h"
#import "AEBlockAudioReceiver.h"

#import "Accelerate/Accelerate.h"


#define MAX_BUFF_LEN 10000

@implementation VoiceLevelNotifier {
    float floatBuffer[MAX_BUFF_LEN];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.weakSelf = self;
        self.audioController = [[AEAudioController alloc]
                initWithAudioDescription:[AEAudioController nonInterleaved16BitStereoAudioDescription] inputEnabled:YES useVoiceProcessing:NO];
        id<AEAudioReceiver> receiver = [AEBlockAudioReceiver audioReceiverWithBlock:
                ^(void                     *source,
                        const AudioTimeStamp     *time,
                        UInt32                    frames,
                        AudioBufferList          *audio) {
                    if ([_weakSelf.voiceLevelDelegate respondsToSelector:@selector(updateFromVoiceNotifier:)]) {
                        float currentMax = 0;
                        vDSP_vflt16(audio->mBuffers[0].mData, 1, floatBuffer, 1, frames);
                        vDSP_maxv(floatBuffer, 1, &currentMax, frames);
                        [_weakSelf.voiceLevelDelegate updateFromVoiceNotifier:currentMax];
                    }
                }];
        [self.audioController addInputReceiver:receiver];
    }
    return self;
}


-(void)startMonitoring {
    [self.audioController start:nil];
}


-(void)stopMonitoring {
    [self.audioController stop];
}



@end