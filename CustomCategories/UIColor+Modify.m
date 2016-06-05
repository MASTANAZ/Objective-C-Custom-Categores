//
//  UIColor+Modify.m
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import "UIColor+Modify.h"

@implementation UIColor (Modify)


/**
 Inverts the color of the UIColor instance that called this
 method.
 **/
- (UIColor *)invertColor
{
    NSArray *components = [self colorComponentArrayForCurrentColorInstance];
    
    return [UIColor colorWithRed: 1 - [components[0] doubleValue]
                           green: 1 - [components[1] doubleValue]
                            blue: 1 - [components[2] doubleValue]
                           alpha:     [components[3] doubleValue]];
}


/**
 Adjusts the color of the UIColor instance that called this
 method to appear translucent.
 **/
- (UIColor *)adjustColorForTranslucency
{
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    
    [self getHue: &hue
      saturation: &saturation
      brightness: &brightness
           alpha: &alpha];
    
    return [UIColor colorWithHue: hue
                      saturation: saturation * 1.158
                      brightness: brightness * 0.95
                           alpha: alpha];
}


/**
 Lightens the color of the UIColor instance that called this
 method by a specified amount.
 **/
- (UIColor *)lightenColor:(CGFloat)lighten
{
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    
    [self getHue: &hue
      saturation: &saturation
      brightness: &brightness
           alpha: &alpha];
    
    return [UIColor colorWithHue: hue
                      saturation: saturation * (1 - lighten)
                      brightness: brightness * (1 + lighten)
                           alpha: alpha];
}


/**
 Darkens the color of the UIColor instance that called this
 method by a specified amount.
 **/
- (UIColor *)darkenColor:(CGFloat)darken
{
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    
    [self getHue: &hue
      saturation: &saturation
      brightness: &brightness
           alpha: &alpha];
    
    return [UIColor colorWithHue: hue
                      saturation: saturation * (1 + darken)
                      brightness: brightness * (1 - darken)
                           alpha: alpha];
}


/**
 Returns an array of the color componetns for the UIColor
 instance that calls a method on this category.
 **/
- (NSArray *)colorComponentArrayForCurrentColorInstance
{
    CGFloat red, green, blue, alpha;
    
    const CGFloat *components = CGColorGetComponents([self CGColor]);
    
    if(CGColorGetNumberOfComponents([self CGColor]) == 2) {
        
        red   = components[0];
        green = components[0];
        blue  = components[0];
        alpha = components[1];
    }
    else {
        
        red   = components[0];
        green = components[1];
        blue  = components[2];
        alpha = components[3];
    }
    
    return @[@(red), @(green), @(blue), @(alpha)];
}

@end
