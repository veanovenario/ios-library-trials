//
//  CustomActivityItemProvider.h
//  iOS Library Trials
//
//  Created by Vea Novenario on 05/01/2017.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActivityItemProvider : UIActivityItemProvider <UIActivityItemSource>

- (instancetype)initWithCaption:(NSString*)caption placeholderItem:(id)placeholderItem;
- (instancetype)initWithImage:(UIImageView *)imageView placeholderItem:(id)placeholderItem;
- (instancetype)initWithLink:(NSURL*)link placeholderItem:(id)placeholderItem;

@end
