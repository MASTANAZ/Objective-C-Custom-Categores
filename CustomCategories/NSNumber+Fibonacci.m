//
//  NSNumber+Fibonacci.m
//  CSConcepts
//
//  Created by Blake Nazario on 5/16/16.
//  Copyright © 2016 Blake Nazario-Casey. All rights reserved.
//

#import "NSNumber+Fibonacci.h"

@implementation NSNumber (Fibonacci)

#warning Maybe look into using a completion handler for these methods.

#pragma mark - Fibonacci Squence Up to Number

/*
 This algorithm is very simple in terms of how straight forward it is.
*/
+ (NSMutableArray*)fibonacciSequenceUpToNumber:(NSUInteger)number {
    NSMutableArray *resultArray = [@[] mutableCopy];
    
    resultArray[0] = @0;
    resultArray[1] = @1;
    
    for (NSUInteger i = 2; i < number; i++) {
        NSNumber *fib = @([resultArray[i - 2] integerValue] + [resultArray[i - 1] integerValue]);
        resultArray[i] = fib;
    }
    
    return resultArray;
}


#pragma mark - Fibonacci Sequence Using Recursion

/*
 This is a recursive approach to a fibonacci sequence that calls itself
 until the index is reached. This is not very optimized.
*/
+ (long long int)fibonacciSequenceUsingRecursionWithIndex:(NSUInteger)index {
    
    // If the index is 0, there are no numbers to execute a sequence
    if (index == 0) {
        return (long long int)0;
    }
    
    // If the index is 1, the only number in the sequence is 1
    else if (index == 1) {
        return (long long int)1;
    }
    
    // If the index is large enough to contain a sequence, recursively call
    // this function until the sequence is finished.
    else {
        return [NSNumber fibonacciSequenceUsingRecursionWithIndex:index - 2] +
               [NSNumber fibonacciSequenceUsingRecursionWithIndex:index - 1];
    }
}


#pragma mark - Fibonacci Sequence Using Long Long

+ (unsigned long long)fibonacciSequenceUsingLongLongWithIndex:(int)index {
    
    // An index of 93 would produce a sequence too large for primitive data types.
    if (index > 93) {
        // A completion block could be used here?
        NSLog(@"Fibonacci at index %i would be too long for ULLONG", index);
        return 0;
    }
    
    unsigned long long beforeLast = 0, last = 1;
    
    // While the index is greater than 0, add the current last number to the previously
    // last number and make the number before the last number equal to the new last number
    // minus the previously last number.
    //
    // Then, move one down in the index.
    while (index > 0) {
        last += beforeLast;
        beforeLast = last - beforeLast;
        
        --index;
    }
    
    // If the index is 0, the fibonacci has completed completely, so return the number
    // before the last number.
    if (index == 0) {
        return beforeLast;
    }
    
    // Otherwise, return the last number.
    return last;
}

@end
