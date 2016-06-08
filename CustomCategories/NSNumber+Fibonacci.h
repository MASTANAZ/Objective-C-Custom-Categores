//
//  NSNumber+Fibonacci.h
//  CSConcepts
//
//  This category is a NSNumber class-level category that
//  returns variations of Fibonacci sequences.
//
//  Created by Blake Nazario on 5/16/16.
//  Copyright © 2016 Blake Nazario-Casey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Fibonacci)


/**
 Return an array of numbers in a fibonacci sequence given
 a provided "n"
 **/
+ (NSMutableArray*)fibonacciSequenceUpToNumber:(NSUInteger)number;

/**
 Recursively return a fibonacci sequence that calls itself
 until the index is reached. WARNING: This is not optimized and will
 most likely result in a memory issue.
 **/
+ (long long int)fibonacciSequenceUsingRecursionWithIndex:(NSUInteger)index;


/**
 Return an unsigned-long-long fibonacci sequence
 **/
+ (unsigned long long)fibonacciSequenceUsingLongLongWithIndex:(int)index;

@end
