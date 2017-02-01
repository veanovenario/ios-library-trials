//
//  CoreLocationViewController.h
//  iOS Library Trials
//
//  Created by Vea Novenario on 1/2/17.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

/* NOTE
 * Add NSLocationAlwaysUsageDescription & NSLocationWhenInUseUsageDescription in Info.plist for permission
 */

@interface CoreLocationViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, strong) IBOutlet UILabel *coordinatesLabel;

// Location Manager
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;

@end
