//
//  APITestViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 10/2/17.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import "APITestViewController.h"
#import "APIHelper.h"

@interface APITestViewController ()

@property (weak, nonatomic) IBOutlet UIButton *runButton;

@end

@implementation APITestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)runButtonPressed:(id)sender {
    APIHelper *apiHelper = [[APIHelper alloc] init];
    [apiHelper connectDotNetStartSession];
}

@end
