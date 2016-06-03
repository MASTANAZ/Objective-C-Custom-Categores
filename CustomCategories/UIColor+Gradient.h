//
//  UIColor+Gradient.h
//  CustomCategories
//
//  This category is a UIColor class-level category
//  that returns UIColor instances of gradients with
//  provided starting and ending colors.
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Gradient)

// Create a gradient that shifts from a provided starting color
// to a provided ending color within a provided height for the
// gradient.
+ (UIColor*)gradientFromStartColor:(UIColor*)startColor
                        toEndColor:(UIColor*)endColor
                        withHeight:(int)height;


@end
