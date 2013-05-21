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
+(UIColor *)colourWithRedHex:(int)redHex greenHex:(int)greenHex blueHex:(int)blueHex alpha:(CGFloat)alpha;

@end
