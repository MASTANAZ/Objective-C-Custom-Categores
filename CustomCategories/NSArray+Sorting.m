//
//  NSArray-Sorting.m
//  CSConcepts
//
//  Created by Blake Nazario on 5/16/16.
//  Copyright © 2016 Blake Nazario-Casey. All rights reserved.
//

#import "NSArray+Sorting.h"

@implementation NSArray (Sorting)

- (BOOL)isSorted {
    return YES;
}

@end

// ***

@implementation NSMutableArray (Sorting)


#pragma mark - Bubble Sort

- (NSMutableArray *)bubbleSort {
    
    NSUInteger count = [self count];
#warning This is set to i<count because otherwise, the app will crash saying the index is out of range. Investigate.
#warning This algorithm is entirely incorrect. Numbers are not sorted completely.
    // For every index of the array,
    for (int i = 0; i < count; i++) {
        
        // For every index up to the current i index,
        for (int j = 0; j < i; j++) {
            
            // If the value at j is less than the value at j+1,
            if ([self[j] compare:self[j+1]] == NSOrderedDescending) {
                
                // Swap values at indexes j and (j+1), then move onto the next i index
                [self exchangeObjectAtIndex:j withObjectAtIndex:(j+1)];
            }
        }
    }
    
    return self;
}


#pragma mark - Shell Sort
/*
 Shell sorting allows the exchange of items that are far apart;
 
 Shellsorts use a gap defined by the space between two objects,
 then progressively reduces the space between the two objects that
 are being compared.
*/

- (NSMutableArray *)shellSort {
    
    NSUInteger count = [self count];
    
    // For the array, iterate through it (count / 2) times
    // After each iteration, reduce the gap by a factor of 2
    for (NSInteger i = count / 2; i > 0; i = i/2) {
        
        // For every index between the current "i" index between
        // i and the count
        for (NSInteger j = i; j < count; j++) {
            
            // For every value at index i+1,
            for (NSInteger k = j-i; k >= 0; k = k-i) {
                
                // If the value at [k+1] is more than the value at k,
                // the values at k and k+1 are sorted correctly.
                // So, move to the next value at index k
                if ([self[k+1] floatValue] >= [self[k] floatValue]) {
                    break;
                }
                
                // If the value at [k+1] is less than the value at k,
                // the values need to be exchanged
                else {
                    [self exchangeObjectAtIndex:k withObjectAtIndex:(k+i)];
                }
            }
            
        }
        
    }
    
    return self;
}


#pragma mark - Insertion Sort
/*
 Insertion sorts build a final sorted array one object at a time.
 
 Insertion sorts iterate up the array, growing the sorted list 
 behind it. At each array position, it will check the value against
 the largest value in the sorted list. If it is larger, it leaves the 
 object in place and moves to the next one. If it is smaller, it finds
 the correct position within the sorted list, shifts all larger values
 up one index, then inserts the object into its correct position.
*/
- (NSMutableArray *)insertionSort {

    NSUInteger count = [self count];
    
    // For every index in the array, starting at index 1,
    for (int i = 1; i < count; i++) {
        
        // For every index between index 0 and j, moving from j to 0 (right to left),
        // given that the value at [j - 1] is greater than the value at [j]
        for (int j = i; (j>0) && ([self[j-1] floatValue] > [self[j] floatValue]); j--) {
            
            // Because the value at [j-1] is greater than the value at [j],
            // shift the value at [j-1] to the right of [j]
            [self exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
        }
    }
    
    return self;
}

@end








