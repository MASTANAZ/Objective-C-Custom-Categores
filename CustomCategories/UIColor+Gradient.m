//
//  UIColor+Gradient.m
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import "UIColor+Gradient.h"

@implementation UIColor (Gradient)

//TODO: Add method to fit gradient within frame with angle of rotation in radians.

/*************************************************************
 Gradient From Start Color to End Color With Height
 
 Returns a UIColor that consists of a gradient from a provided
 starting color to a provided ending color that fits within a 
 provided height.
 **/
+ (UIColor*)gradientFromStartColor:(UIColor *)startColor
                        toEndColor:(UIColor *)endColor
                        withHeight:(int)height
{
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)startColor.CGColor,
                       (id)endColor.CGColor,
                       nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace,
                                                        (__bridge CFArrayRef)colors,
                                                        NULL);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0),
                                CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
