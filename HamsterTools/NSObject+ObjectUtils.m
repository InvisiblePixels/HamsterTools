//
//  NSObject+ObjectUtils.m
//  HamsterTools
//
//  Created by Helen McManus on 14/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSObject+ObjectUtils.h"
#import "NSJSONSerialization+CustomObjectSerialisation.h"

@implementation NSObject (ObjectUtils)

-(kJSONConformityLevel)conformityLevel {
    
    if ([self isKindOfClass:[NSString class]]) {
        return kJSONStandard;
    }
    if ([self isKindOfClass:[NSNumber class]]) {
        return kJSONStandard;
    }
    if ([self isKindOfClass:[NSArray class]]) {
        return kJSONArray;
    }
    if ([self isKindOfClass:[NSDictionary class]]) {
        return kJSONDictionary;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return kJSONStandard;
    }
    
    if ([self conformsToProtocol:@protocol(JSONSerialisable)]) {
        return kJSONCustom;
    }
    
    return kJSONInvalid;
}



@end
