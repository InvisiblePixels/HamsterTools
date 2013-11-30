//
//  NSNumber+Utils.h
//  HamsterTools
//
//  Created by Helen McManus on 11/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSNumber (Utils)

NSString* NSStringFromNumberInBinaryFormat(NSInteger num);

NSInteger shiftAndKeep(NSInteger originalNumber, NSInteger *droppedBit);
unsigned long shiftLeftAndKeep(unsigned long originalNumber, unsigned long *droppedBit);
NSInteger shiftRightAndKeep(NSInteger originalNumber, NSInteger *droppedBit);



@end
