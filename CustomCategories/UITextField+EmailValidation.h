//
//  UITextField+EmailValidation.h
//  Base
//
//  This category is a UITextField instance-level category
//  that returns a true/false boolean value after checking
//  to see if a provided email address string is valid.
//  The method in this category is to be called from the
//  UITextField instance that requires the validation.
//
//  Created by Blake Nazario on 4/21/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Email)

// Pass in an email address string to ensure that it contains valid characters
// and a valid top-level domain.
//
// NOTE: This does not check if the email exists.
- (BOOL)checkIfEmailIsValid:(NSString*)email;


@end
