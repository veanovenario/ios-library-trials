//
//  WebViewController.m
//  GitExperimentation
//
//  Created by Vea Novenario on 19/04/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Auto-play videos
    [self.webView setAllowsInlineMediaPlayback:YES];
    self.webView.mediaPlaybackRequiresUserAction = NO;
    
    // Disable scrolling
//    self.webView.scrollView.scrollEnabled = NO;
//    self.webView.scrollView.bounces = NO;

    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    if ([self.url length] > 0) {
        [[self webView] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if (self.url && [self.url length] > 0 && [self.webView isLoading]) {
        [self.webView stopLoading];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIWebView Delegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    [SVProgressHUD show];
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)paramwebView {
    
    [SVProgressHUD dismiss];
}

@end
