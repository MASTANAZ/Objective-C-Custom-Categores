//
//  UIImage+RenderText.h
//  CustomCategories
//
//  This category is a UIImage class-level category
//  that returns UIImage instances with text
//  rendered over the image.
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Text)

// Render text in an image
+ (UIImage *) drawText:(NSString*) text
               inImage:(UIImage*)  image
               atPoint:(CGPoint)   point
             withColor:(UIColor*)  color;

@end
