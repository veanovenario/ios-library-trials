//
//  CMBManager.h
//  CMBingo
//
//  Created by Vea Novenario on 17/01/2017.
//  Copyright © 2017 CapitaLand Mall Asia Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CMBManager : NSObject

+(instancetype)sharedInstance;

// DELETE - Sample
-(void) showMessageInViewController:(UIViewController *)viewController ;

@end
