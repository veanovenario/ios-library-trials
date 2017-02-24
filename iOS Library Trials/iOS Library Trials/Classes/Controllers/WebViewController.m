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
//    [self.webView setAllowsInlineMediaPlayback:NO]; // with bar
//    [self.webView setAllowsInlineMediaPlayback:YES]; // w/o bar
//    self.webView.mediaPlaybackRequiresUserAction = NO;
    
    // Disable scrolling
//    self.webView.scrollView.scrollEnabled = NO;
//    self.webView.scrollView.bounces = NO;

    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    // UIWebView
    if ([self.url length] > 0) {
        [[self webView] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }

    // WebKit Trial
//    WKWebView *wkView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.webView.frame.size.width, self.webView.frame.size.height)];
//    wkView.navigationDelegate = self;
//    wkView.configuration.allowsInlineMediaPlayback = YES;
//    wkView.configuration.requiresUserActionForMediaPlayback = NO; //deprecated in iOS9 mediaPlaybackRequiresUserAction
//    [wkView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
//    [self.view addSubview:wkView];
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

#pragma mark - WebKit Delegate



#pragma mark - UIWebView Delegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //[SVProgressHUD show];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)paramwebView {
    
    //[SVProgressHUD dismiss];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
