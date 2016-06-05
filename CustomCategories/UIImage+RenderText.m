//
//  UIImage+RenderText.m
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import "UIImage+RenderText.h"

@implementation UIImage (Text)

//TODO: Create/alter method to use an attributed string to allow for more customizability.

/**
 Returns a replaced version of a provided UIImage in which
 a provided string of text has been rendered into the image, 
 where the origin of the provided text's frame exists at a 
 provided point in the image.
 **/
+ (UIImage*) drawText:(NSString*) text
             inImage:(UIImage*)  image
             atPoint:(CGPoint)   point
           withColor:(UIColor*)  color
{
    
    UIFont *font;
    
    if (image.size.width < image.size.height) {
        font = [UIFont boldSystemFontOfSize:image.size.width / 6];
    }
    else {
        font = [UIFont boldSystemFontOfSize:image.size.height / 6];
    }
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    [[UIColor redColor] set];
    [text drawInRect:CGRectIntegral(rect) withFont:font];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
