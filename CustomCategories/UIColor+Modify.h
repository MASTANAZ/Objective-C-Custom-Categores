//
//  UIColor+Modify.h
//  CustomCategories
//
//  This category is a UIColor instance-level category
//  that modifies the UIColor instance that call on
//  the methods in this category. 
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Modify)

// Convert a UIColor instance to its opposite color
- (UIColor *)invertColor;

// Adjust a UIColor instance to a translucent equivalent
- (UIColor *)adjustColorForTranslucency;

// Lighten a UIColor instance by a specified amount
- (UIColor *)lightenColor:(CGFloat)lighten;

// Darken a UIColor instance by a specified amount
- (UIColor *)darkenColor:(CGFloat)darken;

@end
