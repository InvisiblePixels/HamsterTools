//
//  NSMutableArray+ArrayUtils.h
//  HamsterTools
//
//  Created by Helen McManus on 8/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ArrayUtils)

/** Lets you move an object at one index to another.
 
 The rest of the array just shuffles up or done one index as appropriate
 */
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
