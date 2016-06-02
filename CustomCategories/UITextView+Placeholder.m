//
//  UITextView+Placeholder.m
//  CustomCategories
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import "UITextView+Placeholder.h"


// Key to be used for runtime object association (allows direct
// manipulation of the instance object that calls on this
// category in the objective-c runtime)
static const char *k_placeHolderTextView = "k_placeHolderTextView";


@implementation UITextView (Placeholder)

/*************************************************************
 Placeholder Text View
 
 RETURNS a runtime-associated value of the object that is
 paired with the k_placeHolderTextView key.
 **/
- (UITextView *)k_placeHolderTextView
{
    return objc_getAssociatedObject(self, k_placeHolderTextView);
}


/*************************************************************
 Set Placeholder Text View
 
 SETS a strong runtime-associated value of the object that is
 paired with the k_placeHolderTextView key.
 **/
- (void)setK_placeHolderTextView:(UITextView *)placeHolderTextView
{
    objc_setAssociatedObject(self,
                             k_placeHolderTextView,
                             placeHolderTextView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/*************************************************************
 Set Placeholder
 
 SETS a strong runtime-associated value of the object that is
 paired with the k_placeHolderTextView key, of which the
 associated object's text is equal to the passed in place-
 holder.
 **/
- (void)setPlaceHolder:(NSString *)placeHolder
{
    if (![self k_placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setK_placeHolderTextView:textView];
    }
}


#pragma mark - UITextView Delegate


/*************************************************************
 Text View Did Begin Editing
 
 An override of the TextViewDidBeginEditing UITextView 
 delegate method. This override sets the placeholder objectto
 hidden if the text view begins editing.
 **/
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.k_placeHolderTextView.hidden = YES;
}


/*************************************************************
 Text View Did Begin Editing
 
 An override of the TextViewDidEndEditing UITextView delegate 
 method. This override sets the placeholder object to visible 
 if the text view ends editing and contains only an empty 
 string.
 **/
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text && [textView.text isEqualToString:@""]) {
        self.k_placeHolderTextView.hidden = NO;
    }
}



@end
