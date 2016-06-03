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


/*************************************************************
 Test UITextField EmailValidation
 
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
