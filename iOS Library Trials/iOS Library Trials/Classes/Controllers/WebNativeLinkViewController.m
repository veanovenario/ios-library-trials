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
    
    // Can also check per scheme and host
    
    DLog(@"[Scheme] %@",request.URL.scheme); // ex. nativeaction
    DLog(@"[Host] %@",request.URL.host); // ex. showwebpage

    // Through href link
    if ([urlString isEqualToString: @"nativeaction://showwebpage"]) {
        
        // Present the new view controller
        NSString *webviewURL = @"http://facebook.com";
        [self performSegueWithIdentifier:kSegueWebView sender:webviewURL];
        
        return NO;
    } else if ( [ urlString isEqualToString: @"nativeaction://google" ] ) {
        
        // Present the new view controller
        NSString *webviewURL = @"http://google.com";
        [self performSegueWithIdentifier:kSegueWebView sender:webviewURL];
        
        return NO;
    }

    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    

    // Calling a function from a website's javascript
    
    // Normal JS function
//    NSString * jsCallBack1 = [NSString stringWithFormat:@"facebookPostShared()"];
//    [webView stringByEvaluatingJavaScriptFromString:jsCallBack1];
    
    // JS function with parameter
    NSString * jsCallBack2 = [NSString stringWithFormat:@"alert2SubmitContent('%@')",@"I am a parameter"];
    [webView stringByEvaluatingJavaScriptFromString:jsCallBack2];

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
