//
//  UIColor+Hex.m
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import "UIColor+Hex.h"


// C helper methods

/**
 Returns a CGFloat value for the corresponding UIColor
 component of a provided Hexadecimal string by converting 
 NSString-formatted hexadecimal components in the provided 
 string to a full hexadecimal component.
 
 C-SYNTAX: this method uses C-syntax above the class implementation for easier imlementation
           within the class itself.
 **/
CGFloat colorComponentFloatFrom(NSString *string, NSUInteger start, NSUInteger length) {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


// Class/Category Implementation
@implementation UIColor (Hex)


/**
 Returns a UIColor consisting of the UIColor equivalent of a
 provided Hexadecimal integer's corresponding color value. 
 
 This method uses the Color With Hex Int and Alpha method with 
 a default alpha of 1.0 (opaque/ no alpha channel)
 **/
+ (UIColor *)colorWithHexInt:(UInt32)hex
{
    return [UIColor colorWithHexInt:hex andAlpha:1];
}


/**
 Returns a UIColor consisting of the UIColor equivalent of a
 provided Hexadecimal integer's corresponding color value with
 a specified alpha value.
 **/
+ (UIColor *)colorWithHexInt:(UInt32)hex andAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];
}


/**
 Returns a UIColor consisting of the UIColor equivalent of a
 provided Hexadecimal string's corresponding color value.
 
 This method uses the Color Component From() method to convert
 the NSString-formatted Hexadecimal components to equivalent
 UIColor component values.
 **/
+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    
    switch ([colorString length]) {
            
        case 3: // #RGB
            alpha = 1.0f;
            red   = colorComponentFloatFrom(colorString, 0, 1);
            green = colorComponentFloatFrom(colorString, 1, 1);
            blue  = colorComponentFloatFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = colorComponentFloatFrom(colorString, 0, 1);
            red   = colorComponentFloatFrom(colorString, 1, 1);
            green = colorComponentFloatFrom(colorString, 2, 1);
            blue  = colorComponentFloatFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = colorComponentFloatFrom(colorString, 0, 2);
            green = colorComponentFloatFrom(colorString, 2, 2);
            blue  = colorComponentFloatFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = colorComponentFloatFrom(colorString, 0, 2);
            red   = colorComponentFloatFrom(colorString, 2, 2);
            green = colorComponentFloatFrom(colorString, 4, 2);
            blue  = colorComponentFloatFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


/**
 Returns a NSString-formatted Hexadecimal equivalent of a
 provided UIColor.
 **/
+ (NSString*)hexStringFromColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

@end
