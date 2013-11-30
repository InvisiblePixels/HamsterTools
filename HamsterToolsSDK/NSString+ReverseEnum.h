//
//  NSString+ReverseEnum.h
//  HamsterTools
//
//  Created by Hamster on 27/03/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

/* I could've made this a category on NSNumber - in a certain way it is just as logical
 * because you're processing a number - just an int, but still a number.
 *
 * In the end decided to go for NSString because it does end up returning a string.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>

/** The point of this class is to provide some useful debugging information. A lot of Apple methods return an enum which of course when printed out
 is just a number. This is pretty useless if you're actually trying to work out just what some section of code is doing.
 
 So these methods take the number and map it to descriptive text so you know what something is rather than just seeing "3"
 */

@interface NSString (ReverseEnum)

+(NSString *)reverseUIRemoteNotificationType:(NSInteger)rnt;
+(NSString *)reverseCFStreamStatus:(NSInteger)status;
+(NSString *)reverseCFStreamEventType:(NSInteger)event;
+(NSString *)reverseUIApplicationState:(NSInteger)state;
+(NSString *)reverseUIInterfaceOrientation:(NSInteger)orientation;
+(NSString *)reverseSCNetworkReachabilityFlags:(SCNetworkReachabilityFlags)flags;


@end
