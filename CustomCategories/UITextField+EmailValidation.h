//
//  UITextField+EmailValidation.h
//  Base
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
+ (BOOL)checkIfEmailIsValid:(NSString*)email;


@end
