//
//  NSArray-Sorting.h
//  CSConcepts
//
//  This is a NSArray instance-level category that can return
//  a true/false boolean regarding whether or not an array
//  instance is sorted. Also, this category can sort a provided
//  array via bubble sort, shell sort, and insertion sort.
//
//  Created by Blake Nazario on 5/16/16.
//  Copyright © 2016 Blake Nazario-Casey. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Sorting)

- (BOOL)isSorted; // Check if the array is sorted

@end

/*
 Using NSNutableArray interface to directly modify the contents of
 the array instance that calls this method.
 */
@interface NSMutableArray (Sorting)

/**
 Perform a bubble sort. WARNING: Implementation is incorrect.
 **/
- (NSMutableArray*)bubbleSort;


/**
 Perform a shell sort on the array.
 **/
- (NSMutableArray*)shellSort;


/**
 Perform an insertion sort on the array.
 **/
- (NSMutableArray*)insertionSort;


@end
