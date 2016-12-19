//
//  GlobalVariables.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 19/12/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import "GlobalVariables.h"

static GlobalVariables *sharedInstance = nil;

@implementation GlobalVariables

#pragma mark - Singleton Method

+ (GlobalVariables*)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super alloc] init];
    }
    return sharedInstance;
}

@end
