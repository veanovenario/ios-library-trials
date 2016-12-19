//
//  Utils.h
//  iOS Library Trials
//
//  Created by Vea Novenario on 19/12/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Debug Logs
#define DLog(fmt, ...) if (DEBUG) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// Hardware
#define isIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define isIPad (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

// App Version and Build
#define kAppVersion                 [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"]
#define kAppBuild                   [NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey]

// iOS Version
#define kOSVersion                              [UIDevice currentDevice].systemVersion
#define osVersionEqualTo(v)                     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define osVersionGreaterThan(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define osVersionGreaterThanOrEqualTo(v)        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define osVersionLessThan(v)                    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define osVersionLessThanOrEqualTo(v)           ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// iOS Scale / Rendered Pixels
#define systemRenderedPixelScale                [[UIScreen mainScreen] scale]

// Screen Size
#define kScreenHeight                           [UIScreen mainScreen].bounds.size.height
#define kScreenWidth                            [UIScreen mainScreen].bounds.size.width
#define kScreenMaxLength                        (MAX(kScreenWidth, kScreenHeight))
#define kScreenMinLength                        (MIN(kScreenWidth, kScreenHeight))

// Device Type
#define isIPhone4OrLess                         (isIPhone && kScreenMaxLength < 568.0)
#define isIPhone5                               (isIPhone && kScreenMaxLength == 568.0)
#define isIPhone6Or7                            (isIPhone && kScreenMaxLength == 667.0)
#define isIPhone6POr7P                          (isIPhone && kScreenMaxLength == 736.0)
#define isIPadPro                               (isIPad && kScreenMaxLength == 1366)

// Screen Resolution
#define screenIsNormal                          [[UIScreen mainScreen] scale] == 1.0
#define screenIsRetina2                         [[UIScreen mainScreen] scale] == 2.0
#define screenIsRetina3                         [[UIScreen mainScreen] scale] == 3.0

// Hex Value to UIColor
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// Math Functions
#define rad2deg(x) x * 180 / M_PI
#define deg2rad(x) x * M_PI / 180
#define randomf(minX,maxX) ((float)(arc4random() % (maxX - minX + 1)) + (float)minX)

@interface Utils : NSObject

// Validations
+(id)showEmptyIfNull:(id)object;
+(BOOL)isEmailValid:(NSString *)emailParam;

// User Interface - View Layers
+(UIButton *)uiButton:(UIButton *)buttonParam;
+(UIButton *)uiButton:(UIButton *)buttonParam withBorderColor:(CGColorRef)colorParam;

@end
