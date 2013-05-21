//
//  UIColor+ColourUtils.m
//  
//
//  Created by Hamster on 3/03/13.
//
//

#import "UIColor+ColourUtils.h"

@implementation UIColor (ColourUtils)

+(UIColor *)colourWithRedHex:(int)redHex greenHex:(int)greenHex blueHex:(int)blueHex alpha:(CGFloat)alpha {
    
    return  [UIColor colorWithRed:redHex/255.0 green:greenHex/255.0 blue:blueHex/255.0 alpha:(CGFloat)alpha];
    
}



@end
