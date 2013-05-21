//
//  NSURL+Utilities.h
//  HamsterTools
//
//  Created by Helen McManus on 25/10/12.
//  Copyright (c) 2012 InvisiblePixels. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Utilities)

/** An NSURL can be broken down into many different components. The Apple doc however is pretty useless when it comes to explaining just what each of them is.
 
 So call this method on a URL to see what names Apple gives each of the component parts.
 
 This kind of has no real use in production code but is a useful debugging tool and to understand what the Apple docs don't really tell you.
 */
- (NSDictionary *)breakdownURL:(NSURL *)url;

@end
