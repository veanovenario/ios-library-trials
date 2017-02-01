//
//  Constants.h
//  iOS Library Trials
//
//  Created by Vea Novenario on 19/12/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import <Foundation/Foundation.h>

// Device
#define kDeviceOS                                       @"ios"

// Web APIs
#define kAPIBaseURL                                     @""
#define kAPIKey                                         @""

// Storyboard Names
#define kStoryboardSplash                               @"Splash"
#define kStoryboardHome                                 @"Home"
#define kStoryboardFunctionality                        @"Functionality"
#define kStoryboardUserInterface                        @"UserInterface"

// Segue Names
#define kSegueWebView                                   @"showWebpage"
#define kSegueBraintree                                 @"showBraintree"
#define kSegueWebpageNativeLink                         @"showWebpageNativeLink"
#define kSegueSharePerActivityType                      @"showSharePerActivityType"
#define kSegueFrameworkUsage                            @"showFrameworkUsage"
#define kSegueQRCodeScanner                             @"showQRCodeScanner"
#define kSegueCoreLocation                              @"showCoreLocation"

// Messages
#define kMessageDisabledLocation                        @"Location Service is disabled.\nGo to Settings > Privacy > Location Services and allow the app to access your location."

@interface Constants : NSObject

@end
