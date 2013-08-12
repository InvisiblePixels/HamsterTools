//
//  UIColor+ColourUtils.m
//  
//
//  Created by Hamster on 3/03/13.
//
//

#import "UIColor+ColourUtils.h"

@implementation UIColor (ColourUtils)

+(UIColor *)colourWithRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha {
    
    return  [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:(CGFloat)alpha];
    
}

+(UIColor *)colourWithInteger:(long long int)integerColour alpha:(CGFloat)alpha {
    
    int blue = integerColour % 0x100; // mod 256
    integerColour >>= 0x8;
    
    int green = integerColour % 0x100;
    integerColour >>= 0x8;
    
    int red = integerColour;

    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha]; // Don't forget FLOATING POINT DIVISION
}

@end
