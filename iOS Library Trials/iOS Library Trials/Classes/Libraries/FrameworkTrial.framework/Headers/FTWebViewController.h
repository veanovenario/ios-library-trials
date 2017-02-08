//
//  FTWebViewController.h
//  FrameworkTrial
//
//  Created by Vea Novenario on 2/2/17.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTWebViewController : UIViewController

/*!
 * @brief Initialize FTWebViewController which uses a web view to display a webpage.
 * @return FTWebViewController for initialization.
 */
-(id)initWeb;

/*!
 * @brief A method to set parameters needed by the framework.
 * @param baseURL An NSString to be used as URL for the webview.
 */
-(void)setBaseURL:(NSString *)baseURL;

@end
