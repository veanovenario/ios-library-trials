//
//  CMBWebViewController.h
//  CMBingo
//
//  Created by Vea Novenario on 17/01/2017.
//  Copyright © 2017 CapitaLand Mall Asia Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBScannerViewController.h"

@interface CMBWebViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, CMBScannerViewControllerDelegate>

@property (nonatomic, strong, readonly) CMBScannerViewController *scannerViewController;

// Init
-(id)initBingo;
-(void)setURL:(NSString *)bingoURL;

@end
