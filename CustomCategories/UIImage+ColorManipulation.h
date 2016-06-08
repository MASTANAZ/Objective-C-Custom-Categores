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

/**
 Replace every pixel in an image, that is equal to a single specified color, to another color
 that exists within a specified tolerance
 
 @param color The color that will be replaced.
 @param image The image that will be modified.
 @param tolerance The tolerance of colors differing from the color that is being replaced.
 
 @warning `color` Color must not be `nil`.
 @warning `image` Image must not be `nil`.
 @warning `tolerance` Tolerance must not be `nil`.
 **/
 + (UIImage *)replaceColor:(UIColor*)color inImage:(UIImage*)image withTolerance:(float)tolerance;

/**
 Change every white pixel in an image to a transparent pixel
 
 @param image The image that will be modified.
 
 @warning `image` Image must not be `nil`.
 **/
+ (UIImage *)changeWhiteColorTransparent: (UIImage *)image;

/**
 Change every pixel in an image, that is equal to a color specified in an array,
 to a transparent pixel
 
 @param array An array of colors that that will be changed to transparent.
 @param image The image that will be modified.
 
 @warning `array` Array must not be `nil`.
 @warning `image` Image must not be `nil`.
 **/
+ (UIImage *)changeColorTo:(NSMutableArray*)array Transparent:(UIImage *)image;

/**
 Render negative of image
 
 @param sourceImage The image that will be modified.
 
 @warning `sourceImage` Source Image must not be `nil`.
**/
+ (UIImage *)negativeImageWithImage:(UIImage*)sourceImage;

@end
