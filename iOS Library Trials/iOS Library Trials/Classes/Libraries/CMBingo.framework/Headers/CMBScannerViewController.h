//
//  CMBScannerViewController.h
//  CMBingo
//
//  Created by Vea Novenario on 19/01/2017.
//  Copyright © 2017 CapitaLand Mall Asia Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreData/CoreData.h>

@protocol CMBScannerViewControllerDelegate;

@interface CMBScannerViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, unsafe_unretained) id <CMBScannerViewControllerDelegate> delegate;

@end

@protocol CMBScannerViewControllerDelegate

- (void)scannerViewController:(CMBScannerViewController *)controller stringResult:(NSString *)qrCode;

@end

