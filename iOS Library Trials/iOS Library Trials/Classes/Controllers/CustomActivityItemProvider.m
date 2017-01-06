//
//  CustomActivityItemProvider.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 05/01/2017.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import "CustomActivityItemProvider.h"
#import <QuartzCore/QuartzCore.h>

@interface CustomActivityItemProvider ()

@property (strong, nonatomic) NSString *caption;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSURL *link;

@end

@implementation CustomActivityItemProvider

- (instancetype)initWithCaption:(NSString*)caption placeholderItem:(id)placeholderItem{
    
    self = [super initWithPlaceholderItem:placeholderItem];

    if (self) {
        self.caption = caption;
    }
    
    return self;
}

- (instancetype)initWithImage:(UIImageView *)imageView placeholderItem:(id)placeholderItem{
    
    self = [super initWithPlaceholderItem:placeholderItem];
    
    if (self) {
        self.imageView = imageView;
    }
    
    return self;
}

- (instancetype)initWithLink:(NSURL*)link placeholderItem:(id)placeholderItem{
    
    self = [super initWithPlaceholderItem:placeholderItem];
    
    if (self) {
        self.link = link;
    }
    
    return self;
}

- (id) activityViewController:(UIActivityViewController *)activityViewController
          itemForActivityType:(NSString *)activityType{

    if (self.imageView) {
        if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
            return [self shareCustomImageWithImageView:self.imageView  withText:@"View the image with iOS-Library-Trials Mobile App."];
        }else{
            return self.imageView.image;
        }
    }else if(self.caption){
        if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
            return nil;
        }else{
            return self.caption;
        }
    }else if (self.link){
        if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
            return nil;
        }else{
            return self.link;
        }
    }
    
    return nil;
}

- (id) activityViewControllerPlaceholderItem:(UIActivityViewController*)activityViewController {
    return @"";
}

#pragma mark - Private methods

/**
 * Convert the image inside a UIImageView into an image with advertisment logo and text
 */
-(UIImage *)shareCustomImageWithImageView:(UIImageView *)paramImageView withText:(NSString *)paramText{
    
    // Retrieve original image
    UIImage *paramImage = paramImageView.image;
    
    UIImageView *newImageView = [[UIImageView alloc] initWithFrame:CGRectMake(paramImageView.frame.origin.x, paramImageView.frame.origin.y, paramImage.size.width, paramImage.size.height)];
    newImageView.image = paramImage;
    
    // Add original Image
    UIGraphicsBeginImageContextWithOptions(paramImage.size, NO, 0.0);
    [newImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // Add advertisment image
    int imageSize = paramImage.size.width / 10; // 10% of the view
    int margin = 5;
    int x = paramImage.size.width - imageSize - margin;
    int y = margin;
    UIImageView *adImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imageSize, imageSize)];
    [adImageView setContentMode:UIViewContentModeScaleAspectFit];
    [adImageView setImage:[UIImage imageNamed:@"logo_radicals"]];
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), x, y);
    [adImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), -x, -y);
    
    // Add advertisment label
    float textAdHeight = paramImage.size.height / 10; // 10% of the view
    float textAdWidth = paramImage.size.width;
    UILabel *adLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, paramImage.size.height-textAdHeight, textAdWidth, textAdHeight)];
    [adLabel drawTextInRect:CGRectMake(0, paramImage.size.height-textAdHeight, textAdWidth, textAdHeight)];
    
    if (paramText && paramText.length > 0) {
        adLabel.text = paramText;
        adLabel.font = [UIFont systemFontOfSize:(textAdHeight/2)];
        adLabel.textColor = [UIColor blackColor];
        adLabel.backgroundColor = [UIColor lightGrayColor];
        adLabel.textAlignment = NSTextAlignmentCenter;
        adLabel.alpha = 0.7;
        CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, (paramImage.size.height-textAdHeight));
        [adLabel.layer renderInContext:UIGraphicsGetCurrentContext()];
        CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, -(paramImage.size.height-textAdHeight));
    }
    
    // Save new image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}

@end
