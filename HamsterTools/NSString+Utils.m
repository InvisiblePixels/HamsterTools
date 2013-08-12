//
//  NSString+Utils.m
//  HamsterTools
//
//  Created by Helen McManus on 12/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

-(NSString *)tac {
    
    return [self reverseString];
}

-(NSString *)reverseString {
    
    NSMutableString *newString = [[NSMutableString alloc] init];
    
    for (int counter = self.length - 1; counter >= 0; counter--) {
        [newString appendFormat:@"%c", [self characterAtIndex:counter]];
    }
    return newString;
}

@end
