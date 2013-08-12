//
//  NSNumber+Utils.m
//  HamsterTools
//
//  Created by Helen McManus on 11/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSNumber+Utils.h"

NSString* NSStringFromNumberInBinaryFormat(NSInteger num) {
    
    NSMutableString *string = [[NSMutableString alloc] init];
    
    int keptBit;
    
    while (num) {
        num = shiftAndKeep(num, &keptBit);
        [string insertString:[NSString stringWithFormat:@"%d", keptBit] atIndex:0];
    }
    
    return string ;
}

int shiftAndKeep(int originalNumber, int *droppedBit) {
    
    *droppedBit = originalNumber & 1;
    return originalNumber >> 1;    
}

@implementation NSNumber (Utils)

@end
