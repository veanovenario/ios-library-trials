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

/*!
 * @brief Initialize CMBWebViewController which uses a web view to display the bingo game.
 * @return CMBWebViewController for initialization.
 */
-(id)initBingo;

/*!
 * @brief A method that retrieves important parameters for the bingo game to use.
 * @param baseURL An NSString to be used as base URL of the bingo game.
 * @param token An NSString token to be passed to the server.
 * @param profileToken An NSString profile token to be passed to the server.
 */
-(void)setBaseURL:(NSString *)baseURL userID:(NSString *)userID token:(NSString *)token profileToken:(NSString *)profileToken;

@end
