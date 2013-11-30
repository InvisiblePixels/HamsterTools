//
//  NSNumber+Utils.m
//  HamsterTools
//
//  Created by Helen McManus on 11/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSNumber+Utils.h"

@implementation NSNumber (Utils)

NSString* NSStringFromNumberInBinaryFormat(NSInteger num) {
    
    NSMutableString *string = [[NSMutableString alloc] init];
    
    NSInteger keptBit;
    
    while (num) {
        num = shiftAndKeep(num, &keptBit);
        [string insertString:[NSString stringWithFormat:@"%ld", (long)keptBit] atIndex:0];
    }
    
    return string ;
}

NSInteger shiftAndKeep(NSInteger originalNumber, NSInteger *droppedBit) {
    
    return shiftRightAndKeep(originalNumber, droppedBit);
}


// This is *exceptionally* sensitive to size!
unsigned long  shiftLeftAndKeep(unsigned long  originalNumber, unsigned long  *droppedBit) {
    
    unsigned long  shiftBy = (sizeof(unsigned long ) * 8l) - 1l;
    
    // This is going to be 10000000000000000000000000
    // THE 1L IS KEY TO THIS WORKING. WITHOUT THE L IT ***BREAKS***
    unsigned long andedNumber = originalNumber & (1l << shiftBy);
    
    // Need to put that 1000000 number so that the 1 is RHS
    *droppedBit = andedNumber >> shiftBy;
    
    return originalNumber << 1l;
}

NSInteger shiftRightAndKeep(NSInteger originalNumber, NSInteger *droppedBit) {
    *droppedBit = originalNumber & 1;
    return originalNumber >> 1;
}


@end
