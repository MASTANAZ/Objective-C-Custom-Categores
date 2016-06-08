//
//  UIImage+ColorManipulation.h
//  CustomCategories
//
//  This category is a UIImage class-level category
//  that returns UIImage instances with modifications
//  specifically to color.
//
//  Created by Blake Nazario-Casey on 4/18/16.
//  Copyright © 2016 Example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 Create a UIImage of a solid color with a specified frame
 
 @param backgroundColor The color to set for the UIImage.
 @param rect The frame for which the image will be contained in.
 
 @warning `backgroundColor ` must not be `nil`.
 @warning `rect` must not be nil.
**/
+ (UIImage *)setBackgroundImageByColor:(UIColor *)backgroundColor withFrame:(CGRect )rect;

// Replace every pixel in an image, that is equal to a single specified color, to another color
// that exists within a specified tolerance
+ (UIImage *)replaceColor:(UIColor*)color inImage:(UIImage*)image withTolerance:(float)tolerance;

// Change every white pixel in an image to a transparent pixel
+ (UIImage *)changeWhiteColorTransparent: (UIImage *)image;

// Change every pixel in an image, that is equal to a color specified in an array, to a transparent pixel
+ (UIImage *)changeColorTo:(NSMutableArray*)array Transparent:(UIImage *)image;

// Render negative of image
+ (UIImage *)negativeImageWithImage:(UIImage*)sourceImage;

@end
