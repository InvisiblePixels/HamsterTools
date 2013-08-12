//
//  NSNumber+Utils.h
//  HamsterTools
//
//  Created by Helen McManus on 11/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* NSStringFromNumberInBinaryFormat(NSInteger num);
int shiftAndKeep(int originalNumber, int *droppedBit);

@interface NSNumber (Utils)

@end
