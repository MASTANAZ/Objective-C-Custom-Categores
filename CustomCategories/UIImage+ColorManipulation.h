//
//  ImageColorManipulator.h
//  ImageModifierTest
//
//  Created by Blake Nazario-Casey on 4/18/16.
//  Copyright © 2016 Example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

// Create a UIImage of a solid color with a specified frame
+ (UIImage *)setBackgroundImageByColor:(UIColor *)backgroundColor withFrame:(CGRect )rect;

// Replace every pixel in an image, that is equal to a single specified color with a specified tolerance,
// to another color.
+ (UIImage *)replaceColor:(UIColor*)color inImage:(UIImage*)image withTolerance:(float)tolerance;

// Change every white pixel in an image to a transparent pixel
+ (UIImage *)changeWhiteColorTransparent: (UIImage *)image;

// Change every pixel in an image, that is equal to a color specified in an array, to a transparent pixel
+ (UIImage *)changeColorTo:(NSMutableArray*)array Transparent:(UIImage *)image;

// Render negative of image
+ (UIImage *)negativeImageWithImage:(UIImage*)sourceImage;

@end
