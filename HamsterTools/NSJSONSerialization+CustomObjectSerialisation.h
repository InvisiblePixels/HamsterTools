//
//  NSJSONSerialization+CustomObjectSerialisation.h
//  HamsterTools
//
//  Created by Helen McManus on 14/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ObjectUtils.h"

/** Objects that follow this protocol can have themselves converted into a JSON representation (a bit like NSKeyedArchiver only into JSON representation rather than binary plist format)
 */
@protocol JSONSerialisable <NSObject>

-(NSDictionary *)dictionaryRepresentationOfObject;

@end



@interface NSJSONSerialization (CustomObjectSerialisation)

/** This is how you actually convert an object conforming to JSONSerialisable into a JSON representation
 */
+(NSData *) dataWithCustomJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError **)error;


@end
