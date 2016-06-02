//
//  UITextView+Placeholder.h
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

// Imported to set, get, and modify runtime-associated objects
#import <objc/runtime.h>

@interface UITextView (Placeholder) <UITextViewDelegate>

// Property to create a strong reference to the runtime-associated object
// for the instance object that calls on this method
@property (nonatomic, strong) UITextView *k_placeHolderTextView;

// Create a placeholder for a UITextView
- (void)setPlaceHolder:(NSString *)placeHolder;

@end
