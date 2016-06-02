//
//  UIColor+Gradient.h
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Gradient)

+ (UIColor*)gradientFromStartColor:(UIColor*)startColor toEndColor:(UIColor*)endColor withHeight:(int)height;


@end
