//
//  UIColor+Hex.h
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

// Get a UIColor from a Hexadecimal 32-bit integer
+ (UIColor *)colorWithHexInt:(UInt32)hex;

// Get a UIColor from a Hexadecimal 32-bit integer with a specified alpha
+ (UIColor *)colorWithHexInt:(UInt32)hex andAlpha:(CGFloat)alpha;

// Get a UIColor from a Hexadecimal NSString
+ (UIColor *)colorWithHexString:(NSString *)hexString;

// Get a Hexadecimal NSString from a provided UIColor
+ (NSString*)hexStringFromColor:(UIColor *)color;

@end
