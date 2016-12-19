//
//  HomeViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 19/12/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import "HomeViewController.h"
#import "FunctionalityViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *functionalityButton;
@property (weak, nonatomic) IBOutlet UIButton *userInterfaceButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Buttons
    self.functionalityButton = [Utils uiButton:self.functionalityButton];
    self.userInterfaceButton = [Utils uiButton:self.userInterfaceButton];
}

#pragma mark - Buttons

- (IBAction)functionButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kStoryboardFunctionality bundle:nil];
    FunctionalityViewController *nextVC = (FunctionalityViewController *) [storyboard instantiateViewControllerWithIdentifier:@"FunctionalityViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)userInterfaceButtonPressed:(id)sender {

}

@end
