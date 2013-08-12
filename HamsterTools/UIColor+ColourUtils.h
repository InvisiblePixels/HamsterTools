//
//  UIColor+ColourUtils.h
//  
//
//  Created by Hamster on 3/03/13.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (ColourUtils) 

/** Creates a UIColor from hex values.
 
 Pass it something like FF FF FF to get white!
 */
+(UIColor *)colourWithRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;
+(UIColor *)colourWithInteger:(long long int)integerColour alpha:(CGFloat)alpha;

@end
