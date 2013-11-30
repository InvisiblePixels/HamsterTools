//
//  UIColor+ColourUtils.m
//  
//
//  Created by Hamster on 3/03/13.
//
//

#import "UIColor+ColourUtils.h"

@implementation UIColor (ColourUtils)

+(UIColor *)colourWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    
    return  [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:(CGFloat)alpha];
}

+(UIColor *)colourWithInteger:(NSInteger)integerColour alpha:(CGFloat)alpha {
       
    NSInteger blue = integerColour % 0x100; // mod 256
    integerColour >>= 0x8;
    
    NSInteger green = integerColour % 0x100;
    integerColour >>= 0x8;
    
    NSInteger red = integerColour;

    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha]; // Don't forget FLOATING POINT DIVISION
}

@end
