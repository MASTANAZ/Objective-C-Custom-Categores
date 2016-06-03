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

extern NSTimeInterval const UILabelAutoWriteDefaultDuration;
extern unichar const UILabelAutoWriteDefaultCharacter;

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

@property (strong, nonatomic) NSOperationQueue *automaticWritingOperationQueue;
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
