//
//  CoreLocationViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 1/2/17.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import "CoreLocationViewController.h"

@interface CoreLocationViewController ()

@property (weak, nonatomic) IBOutlet UIButton *getLocationButton;

@end

@implementation CoreLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Buttons
    self.getLocationButton = [Utils uiButton:self.getLocationButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Location Manager private methods

-(void)retrieveLocation{
    // Monitor location
    if (!_locationManager){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _currentLocation = nil;
    if(osVersionGreaterThan(@"8")) {
        [_locationManager requestAlwaysAuthorization];
        [_locationManager requestWhenInUseAuthorization];
    }
    [self startUpdatingLocation];
    
    [SVProgressHUD show];
    
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) {
        
    } else {
        // !locationServicesEnabled = location services disabled in settings
        // kCLAuthorizationStatusDenied = denied by user
        // kCLAuthorizationStatusRestricted = restricted by parental controls
        // kCLAuthorizationStatusNotDetermined = unable to determine
        
        [SVProgressHUD dismiss];

        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:kMessageDisabledLocation preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) { }];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

#pragma mark - Location Manager delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    if (newLocation.coordinate.latitude != 0 && newLocation.coordinate.longitude != 0) {
        DLog(@"Current Location Retrieved: %f, %f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
        
        _currentLocation = newLocation;
        [_locationManager stopUpdatingLocation];
        
        if (_currentLocation) {
            self.coordinatesLabel.text = [NSString stringWithFormat:@"%f, %f",newLocation.coordinate.latitude,newLocation.coordinate.longitude];
        }
    }
    
    [SVProgressHUD dismiss];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    DLog(@"Location Manager: Failed to retrieve");
    [SVProgressHUD dismiss];
}

- (void)startUpdatingLocation {
    [_locationManager stopUpdatingLocation];
    [_locationManager startUpdatingLocation];
}

#pragma - Navigation

- (IBAction)getLocationButtonPressed:(id)sender {
    [self retrieveLocation];
}

@end
