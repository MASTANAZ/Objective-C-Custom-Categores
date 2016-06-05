//
//  UILabel+AutoText.h
//  CustomCategories
//
//  This category is a UILabel instance/class-level category
//  that inserts animates a UILabel to appear as if text is
//  being typed into it.
//
//  This is a UILabel class-level category because it modifies
//  UILabel selectors at runtime using method swizzling and
//  interfaces with the UILabel class in the runtime.
//
//  This is a UILabel instance-level category because the
//  methods of this category that enable the animation are
//  called directly from UILabel instances and the instances
//  are ultimately what is being modified.
//
//
//  Created by Blake Nazario on 6/3/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


// Globally accessable time interval that dictates the length of time that the
// animation will take place.
extern NSTimeInterval const UILabelAutoWriteDefaultDuration;

// Globally accessible character that dictates the default character (such as
// the cursor)
extern unichar const UILabelAutoWriteDefaultCharacter;

// Enumerated type that is used to determine the type of blinking and animation
// for the animated UILabel instance.
typedef NS_ENUM(NSInteger, UILabelBlinkingMode)
{
    UILabelBlinkingModeNone,
    UILabelBlinkingModeUntilFinish,
    UILabelBlinkingModeUntilFinishKeeping,
    UILabelBlinkingModeWhenFinish,
    UILabelBlinkingModeWhenFinishShowing,
    UILabelBlinkingModeAlways
};



@interface UILabel (AutoText)

// Operation Queue instance that will be used to perform the writing animation
@property (strong, nonatomic) NSOperationQueue *automaticWritingOperationQueue;

// Property that dictates the insets of the text within the bounds of the UILabel
@property (assign, nonatomic) UIEdgeInsets edgeInsets;


- (void)setTextWithAutomaticWritingAnimation:(NSString *)text;

- (void)setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelBlinkingMode)blinkingMode;

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration;

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
                                                             blinkingMode:(UILabelBlinkingMode)blinkingMode;

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
                                                             blinkingMode:(UILabelBlinkingMode)blinkingMode
                                                        blinkingCharacter:(unichar)blinkingCharacter;

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
                                                             blinkingMode:(UILabelBlinkingMode)blinkingMode
                                                        blinkingCharacter:(unichar)blinkingCharacter
                                                               completion:(void (^)(void))completion;


@end
