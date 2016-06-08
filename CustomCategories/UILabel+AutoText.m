//
//  UILabel+AutoText.m
//  CustomCategories
//
//  Created by Blake Nazario on 6/3/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import "UILabel+AutoText.h"

// Imported to set, get, and modify runtime-associated objects
#import <objc/runtime.h>      

// Define the global Time Interval for automatic writing animation
NSTimeInterval const UILabelAutoWriteDefaultDuration = 0.4f;

// Define the global character
unichar        const UILabelAutoWriteDefaultCharacter = 124;


// C helper methods
/**
 Method Swizzler that changes the implementation of the
 original selector at runtime.
 **/
static inline void AutomaticWritingSwizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// Instantiating keys to store values for Operation Queue and Edge Insets
// accessed for the 
static char kAutomaticWritingOperationQueueKey;
static char kAutomaticWritingEdgeInsetsKey;


@implementation UILabel (AutoText)

@dynamic automaticWritingOperationQueue, edgeInsets;


#pragma mark - Public Methods
// Override UILabel load
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AutomaticWritingSwizzleSelector([self class], @selector(textRectForBounds:limitedToNumberOfLines:),
                                      @selector(automaticWritingTextRectForBounds:limitedToNumberOfLines:));
        
        AutomaticWritingSwizzleSelector([self class], @selector(drawTextInRect:), @selector(drawAutomaticWritingTextInRect:));
    });
}


/**
 Method called externally that will modify an instance of a
 UILabel the text passed to it, drawn in a provided CGRect.
 **/
-(void)drawAutomaticWritingTextInRect:(CGRect)rect {
    [self drawAutomaticWritingTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}


/*************************************************************
 Automatic Writing Text Rect For Bounds Limited to Number Of
 Lines
 
 Returns a CGRect instance that will dictate the size of tbe
 UILabel frame and the number of lines allowed
 **/
- (CGRect)automaticWritingTextRectForBounds:(CGRect)bounds
                     limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [self automaticWritingTextRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets)
                                       limitedToNumberOfLines:numberOfLines];
    return textRect;
}


/**
 Sets the insets of the text within the frame of the UILabel
 instance.
 **/
- (void)setedgeInsets:(UIEdgeInsets)edgeInsets {
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, [NSValue valueWithUIEdgeInsets:edgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/**
 Getter method for edge insets of the animated UILabel
 instance.
 **/
- (UIEdgeInsets)edgeInsets {
    NSValue *edgeInsetsValue = objc_getAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey);
    
    if (edgeInsetsValue)
    {
        return edgeInsetsValue.UIEdgeInsetsValue;
    }
    
    edgeInsetsValue = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
    
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, edgeInsetsValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return edgeInsetsValue.UIEdgeInsetsValue;
}


/**
 Sets the operation queue that the animation will take place
 under.
 **/
- (void)setautomaticWritingOperationQueue:(NSOperationQueue *)automaticWritingOperationQueue {
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, automaticWritingOperationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/**
 Getter method for the operation queue that the animation will
 take place under.
 **/
- (NSOperationQueue *)automaticWritingOperationQueue {
    NSOperationQueue *operationQueue = objc_getAssociatedObject(self, &kAutomaticWritingOperationQueueKey);
    
    if (operationQueue) {
        return operationQueue;
    }
    
    operationQueue = NSOperationQueue.new;
    operationQueue.name = @"Automatic Writing Operation Queue";
    operationQueue.maxConcurrentOperationCount = 1;
    
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, operationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return operationQueue;
}


/**
 Sets the text for the automatic writing animation
 **/
- (void)setTextWithAutomaticWritingAnimation:(NSString *)text {
    [self setText:text automaticWritingAnimationWithBlinkingMode:UILabelBlinkingModeNone];
}


/**
 Sets the text with animation and a blinking character
 **/
- (void)setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelBlinkingMode)blinkingMode {
    [self setText:text automaticWritingAnimationWithDuration:UILabelAutoWriteDefaultDuration blinkingMode:blinkingMode];
}


/**
 Sets the text with an animation and a provided duration
 of the animation.
 **/
- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration{
    [self setText:text automaticWritingAnimationWithDuration:duration blinkingMode:UILabelBlinkingModeNone];
}


/**
 Sets the text with an animation and a provided duration
 of the animation and a provided blinking mode.
 **/
- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
                                                          blinkingMode:(UILabelBlinkingMode)blinkingMode
{
    [self setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:UILabelAutoWriteDefaultCharacter];
}


/**
 Sets the text with an animation and a provided duration
 of the animation and a provided blinking mode and a provided
 blinking character
 **/
- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
                                                          blinkingMode:(UILabelBlinkingMode)blinkingMode
                                                     blinkingCharacter:(unichar)blinkingCharacter
{
    [self setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:blinkingCharacter completion:nil];
}


/**
 Sets the text with an animation and a provided duration
 of the animation and a provided blinking mode and a provided
 blinking character and includes a completion block.
 **/
- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
                                                          blinkingMode:(UILabelBlinkingMode)blinkingMode
                                                     blinkingCharacter:(unichar)blinkingCharacter
                                                            completion:(void (^)(void))completion
{
    self.automaticWritingOperationQueue.suspended = YES;
    self.automaticWritingOperationQueue = nil;
    
    self.text = @"";
    
    NSMutableString *automaticWritingText = NSMutableString.new;
    
    if (text)
    {
        [automaticWritingText appendString:text];
    }
    
    [self.automaticWritingOperationQueue addOperationWithBlock:^{
        [self automaticWritingWithText:automaticWritingText
                              duration:duration
                                  mode:blinkingMode
                             character:blinkingCharacter
                            completion:completion];
    }];
}


#pragma mark - Private Methods

/**
 Sets the text with an animation and a provided duration
 of the animation and a provided blinking mode and a provided
 blinking character and includes a completion block.
 **/
- (void)automaticWritingWithText:(NSMutableString *)text
                        duration:(NSTimeInterval)duration
                            mode:(UILabelBlinkingMode)mode
                       character:(unichar)character
                      completion:(void (^)(void))completion
{
    NSOperationQueue *currentQueue = NSOperationQueue.currentQueue;
    if ((text.length || mode >= UILabelBlinkingModeWhenFinish) && !currentQueue.isSuspended)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (mode != UILabelBlinkingModeNone)
            {
                if ([self isLastCharacter:character])
                {
                    [self deleteLastCharacter];
                }
                else if (mode != UILabelBlinkingModeWhenFinish || !text.length)
                {
                    [text insertString:[self stringWithCharacter:character] atIndex:0];
                }
            }
            
            if (text.length)
            {
                [self appendCharacter:[text characterAtIndex:0]];
                [text deleteCharactersInRange:NSMakeRange(0, 1)];
                if ((![self isLastCharacter:character] && mode == UILabelBlinkingModeWhenFinishShowing) || (!text.length && mode == UILabelBlinkingModeUntilFinishKeeping))
                {
                    [self appendCharacter:character];
                }
            }
            
            if (!currentQueue.isSuspended)
            {
                [currentQueue addOperationWithBlock:
                 ^{
                    [self automaticWritingWithText:text
                                          duration:duration
                                              mode:mode
                                         character:character
                                        completion:completion];
                }];
            }
            else if (completion)
            {
                completion();
            }
        });
    }
    else if (completion)
    {
        completion();
    }
}


/**
 Converts a provided unichar character to a NSString
 **/
- (NSString *)stringWithCharacter:(unichar)character
{
    return [self stringWithCharacters:@[@(character)]];
}


/**
 Converts a provided arrah of unichar character to a single
 NSString
 **/
- (NSString *)stringWithCharacters:(NSArray *)characters
{
    NSMutableString *string = NSMutableString.new;
    
    for (NSNumber *character in characters)
    {
        [string appendFormat:@"%C", character.unsignedShortValue];
    }
    
    return string.copy;
}

/**
 Appends a unichar character to a NSString
 **/
- (void)appendCharacter:(unichar)character
{
    [self appendCharacters:@[@(character)]];
}

/**
 Appends a provided array of unichar characters to a NSString
 **/
- (void)appendCharacters:(NSArray *)characters
{
    self.text = [self.text stringByAppendingString:[self stringWithCharacters:characters]];
}


/**
 Returns a true/false value checking if the provided array of
 unichar characters are the last characters of the NSString
 **/
- (BOOL)isLastCharacters:(NSArray *)characters
{
    if (self.text.length >= characters.count)
    {
        return [self.text hasSuffix:[self stringWithCharacters:characters]];
    }
    return NO;
}


/**
 Returns a true/false value checking if the provided unichar
 character is the last character of the NSString
 **/
- (BOOL)isLastCharacter:(unichar)character
{
    return [self isLastCharacters:@[@(character)]];
}


/**
 Returns a true/false value checking if the provided array of
 unichar characters have been deleted from the NSString
 **/
- (BOOL)deleteLastCharacters:(NSUInteger)characters
{
    if (self.text.length >= characters)
    {
        self.text = [self.text substringToIndex:self.text.length-characters];
        return YES;
    }
    return NO;
}


/**
 Returns a true/false value checking if the provided unichar
 character has been deleted from the NSString
 **/
- (BOOL)deleteLastCharacter
{
    return [self deleteLastCharacters:1];
}


@end
