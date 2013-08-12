//
//  NSMutableArray+ArrayUtils.m
//  HamsterTools
//
//  Created by Helen McManus on 8/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSMutableArray+ArrayUtils.h"

@implementation NSMutableArray (ArrayUtils)

-(void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    
    if (fromIndex == toIndex) {
        return;
    }
    
    // First grab the object
    id objectToMove = [self objectAtIndex:fromIndex];
    
    // Now remove it from the array
    if (fromIndex > toIndex) {
        // Remove then insert
        [self removeObjectAtIndex:fromIndex];
        [self insertObject:objectToMove atIndex:toIndex];
        return;
    }
    
    // If here, then to is > from
    // Insert and then remove
    [self insertObject:objectToMove atIndex:toIndex];
    [self removeObjectAtIndex:fromIndex];
    return;
}

@end
