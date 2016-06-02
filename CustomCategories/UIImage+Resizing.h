//
//  UIImage+Resizing.h
//  CustomCategories
//
//  This category is a UIImage class-level category
//  that returns UIImage instances with modifications
//  specifically to size.
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Size)

// Resizing an Image
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
