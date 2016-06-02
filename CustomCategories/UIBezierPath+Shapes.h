//
//  UIBezierPath+Shapes.h
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Shape)

// Render a bezier heart shape bounded in a provided frame
+ (UIBezierPath *)heartShapeFromFrame:(CGRect)originalFrame;

// Render a bezier user shape bounded in a provided frame
+ (UIBezierPath *)userShapeFromFrame:(CGRect)originalFrame;

// Render a bezier martini shape bounded in a provided frame
+ (UIBezierPath *)martiniShapeFromFrame:(CGRect)originalFrame;

// Render a bezier beaker shape bounded in a provided frame
+ (UIBezierPath *)beakerShapeFromFrame:(CGRect)originalFrame;

// Render a bezier start shape bounded in a provided frame
+ (UIBezierPath *)starShapeFromFrame:(CGRect)originalFrame;

// Render a provided number of bezier star shapes bounded in a provided frame
+ (UIBezierPath *)multipleStarShapes:(NSUInteger)numberOfStars inFrame:(CGRect)originalFrame;

@end
