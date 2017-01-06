//
//  SharePerActivityViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 05/01/2017.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import "SharePerActivityViewController.h"
#import "CustomActivityItemProvider.h"

@interface SharePerActivityViewController ()

@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation SharePerActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)shareButtonPressed:(id)sender {
    
    UIImageView *tempIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sample_image1"]];
    CustomActivityItemProvider *aipCaption = [[CustomActivityItemProvider alloc] initWithCaption:@"Sample Caption"placeholderItem:@""];
    CustomActivityItemProvider *aipImage = [[CustomActivityItemProvider alloc] initWithImage:tempIV placeholderItem:@""];
    CustomActivityItemProvider *aipLink = [[CustomActivityItemProvider alloc] initWithLink:nil placeholderItem:@""];
    NSArray *activityItems = @[aipCaption, aipImage, aipLink];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

@end