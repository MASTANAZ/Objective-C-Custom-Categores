//
//  UIImage+Resizing.m
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import "UIImage+Resizing.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (Size)


/*************************************************************
 Image With Image Scaled to Size
 
 Returns a replaced version of a provided UIImage in which
 the image has been scaled to a new two-dimensional size.
 **/
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
