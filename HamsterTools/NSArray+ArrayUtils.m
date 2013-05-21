//
//  NSArray+ArrayUtils.m
//  HamsterTools
//
//  Created by Helen McManus on 11/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSArray+ArrayUtils.h"

@implementation NSArray (ArrayUtils)

-(id)objectAtIndexedSubscript:(NSInteger)idx {
    
    NSUInteger index = idx;
    
    if (idx < 0) {
        // Negative index.
        index = self.count + idx;
    }
    return [self objectAtIndex:index];
}



@end
