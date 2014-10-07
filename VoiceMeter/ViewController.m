//
//  ViewController.m
//  VoiceMeter
//
//  Created by JS on 07/10/14.
//  Copyright (c) 2014 TappyTaps. All rights reserved.
//


#import "ViewController.h"
#import "VoiceLevelNotifier.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];


    VoiceLevelNotifier *voiceLevel = [[VoiceLevelNotifier alloc] init];
    voiceLevel.voiceLevelDelegate = self;
    [voiceLevel startMonitoring];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)updateFromVoiceNotifier:(float)level {
    NSLog(@"New voice level: %f", level);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end