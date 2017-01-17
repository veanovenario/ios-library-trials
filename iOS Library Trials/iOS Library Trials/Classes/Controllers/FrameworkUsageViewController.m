//
//  FrameworkUsageViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 11/01/2017.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import "FrameworkUsageViewController.h"

@interface FrameworkUsageViewController ()

@property (weak, nonatomic) IBOutlet UIButton *frameworkButton1;
@property (weak, nonatomic) IBOutlet UIButton *frameworkButton2;

@end

@implementation FrameworkUsageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Buttons
    self.frameworkButton1 = [Utils uiButton:self.frameworkButton1];
    self.frameworkButton2 = [Utils uiButton:self.frameworkButton2];
}

- (IBAction)button1Pressed:(id)sender {
    
}

- (IBAction)button2Pressed:(id)sender {
    
}

@end
