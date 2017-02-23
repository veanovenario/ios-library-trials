//
//  WebViewController.h
//  GitExperimentation
//
//  Created by Vea Novenario on 19/04/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController <WKNavigationDelegate>

@property (strong, nonatomic) NSString *url;

@end
