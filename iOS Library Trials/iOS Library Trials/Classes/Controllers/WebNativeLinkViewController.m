//
//  WebNativeLinkViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 30/12/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import "WebNativeLinkViewController.h"
#import "WebViewController.h"

@interface WebNativeLinkViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebNativeLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"WebpageNativeLink" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
}

#pragma mark - UIWebView Delegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = request.URL;
    NSString *urlString = url.absoluteString;
    
    //Check if special link
    if ( [ urlString isEqualToString: @"nativeaction://showwebpage" ] ) {
        // Present the new view controller
        NSString *webviewURL = @"http://facebook.com";
        [self performSegueWithIdentifier:kSegueWebView sender:webviewURL];
        
        return NO;
    }
    
    return YES;
}

#pragma - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:kSegueWebView]) {
        NSString *urlString = (NSString *)sender;
        WebViewController *nextVC = (WebViewController *) segue.destinationViewController;
        nextVC.url = urlString;
    }
}

@end
