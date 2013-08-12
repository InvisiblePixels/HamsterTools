//
//  NSObject+ObjectUtils.h
//  HamsterTools
//
//  Created by Helen McManus on 14/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ObjectUtils)

// This is what's returned by conformityLevel method (also part of this class).
typedef enum {
    
    kJSONInvalid = 0, // Not any sort of valid JSON accepted type.
    kJSONStandard, // A number
    kJSONDictionary,
    kJSONArray,
    kJSONCustom // An object that conforms to JSONSerialisable protocol (see NSJSONSerialization+CustomObjectSerialisation.h)    
} kJSONConformityLevel;

/** Call this method on an object and it tells you from JSON's point of view what type of object it is.

Its return value is one of kJSONConformityLevel declared in this category.
 */
-(kJSONConformityLevel)conformityLevel;

@end
