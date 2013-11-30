//
//  NSArray+ArrayUtils.h
//  HamsterTools
//
//  Created by Helen McManus on 11/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ArrayUtils)

/** This implements NEGATIVE array indexing.
 
 You use the array as normal: array[-1]. The [] simply makes a call to objectAtIndexedSubscript.
 That method is overridden here so that it deals with negative arrays
 */
- (id)objectAtIndexedSubscript:(NSInteger)idx;

@end
