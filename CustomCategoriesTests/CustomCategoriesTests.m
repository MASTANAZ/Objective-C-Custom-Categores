//
//  CustomCategoriesTests.m
//  CustomCategoriesTests
//
//  Created by Blake Nazario on 6/2/16.
//  Copyright © 2016 Kudoko, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>


/**************************************
 
 UIImage Categories

 **/
#import "UIImage+ColorManipulation.h"
#import "UIImage+Resizing.h"
#import "UIImage+RenderText.h"


/**************************************

 UITextField Categories
 
 **/
#import "UITextField+EmailValidation.h"


/**************************************
 
 UIBezierPath Categories
 
 **/
#import "UIBezierPath+Shapes.h"


/**************************************
 
 UIColor Categories
 
 **/
#import "UIColor+Gradient.h"
#import "UIColor+Hex.h"
#import "UIColor+Modify.h"


/**************************************
 
 UITextView Categories
 
 **/
#import "UITextView+Placeholder.h"


/**************************************
 
 NSNumber Categories
 
 **/
#import "NSNumber+Fibonacci.h"


@interface CustomCategoriesTests : XCTestCase

@end

@implementation CustomCategoriesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Test UITextField Categories
#pragma mark Email Validation
/**
 Executes a test to ensure that the Check if Email Is Valid
 method will execute successfully
 **/
- (void)testUITextField_EmailValidation
{
    // Creating UITextField instance;
    UITextField *aTextField = [[UITextField alloc]init];

    XCTAssertNotNil([NSNumber numberWithBool:[aTextField checkIfEmailIsValid:@"an@email.com"]] , @"Email Check method did not execute with an expected return for a valid email");
    
    XCTAssertNotNil([NSNumber numberWithBool:[aTextField checkIfEmailIsValid:@"invalid@email1"]] , @"Email Check method did not execute with an expected return for an invalid email");
    
    // No tear down needed
}


#pragma mark - Test NSNumber categories
#pragma mark Fibonacci Sequences

// Sequence Up To Number
- (void)testNSNumber_Fibonacci_sequenceUpToNumber {
    
    NSUInteger number = 20;
    NSArray *arrayOfNumsInSequence = [NSNumber fibonacciSequenceUpToNumber: number];
    
    // Check true/false value after dispatch_group is notified of iteration completion.
    BOOL sequenceIsValid = NO;
    
    
    // arr[n] should equal arr[n-2] + arr[n-1]
    // Check if the numbers in array are correct for a fib sequence.
    dispatch_group_t sequenceCheck = dispatch_group_create();
    dispatch_group_enter(sequenceCheck);
    for (unsigned long long index = (unsigned long long)arrayOfNumsInSequence.count - 1; index>1; index--) {
        
        // Sequence is incorrect
        if ([arrayOfNumsInSequence[index] unsignedIntegerValue] !=
                                            [arrayOfNumsInSequence[index-2] unsignedIntegerValue]
                                          + [arrayOfNumsInSequence[index-1] unsignedIntegerValue])
        {
            sequenceIsValid = NO;
            break;
        }
        
        else {
            sequenceIsValid = YES;
        }
    }
    
    dispatch_group_leave(sequenceCheck);
    dispatch_group_notify(sequenceCheck, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        if (sequenceIsValid) {
            // No teardown needed.
            
            NSLog(@"Sequence is correct: %@", arrayOfNumsInSequence);
        }
        
        else {
            XCTAssert(NO, @"Error: sequence value incorrect at index");
        }
    });
}


#pragma mark - Other Functions
//TODO: Add more test methods 

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
