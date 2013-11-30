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
+(UIColor *)colourWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
+(UIColor *)colourWithInteger:(NSInteger)integerColour alpha:(CGFloat)alpha;

@end
