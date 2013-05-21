//
//  NSJSONSerialization+CustomObjectSerialisation.m
//  HamsterTools
//
//  Created by Helen McManus on 14/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSJSONSerialization+CustomObjectSerialisation.h"


@implementation NSJSONSerialization (CustomObjectSerialisation) 



+(NSMutableDictionary *)createDictionaryFromOriginalDict:(NSDictionary *)originalDict {
    
    NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
    
    // Loop over each key of the exising array and pop in the new array as appropriate
    for (NSString *key in [originalDict allKeys]) {
        
        if ([originalDict[key] conformityLevel] == kJSONStandard) {
            newDict[key] = originalDict[key];
        }
        
        if ([originalDict[key] conformityLevel] == kJSONDictionary) {
            newDict[key] = [self createDictionaryFromOriginalDict:originalDict[key]];
        }
        
        if ([originalDict[key] conformityLevel] == kJSONArray) {
            newDict[key] = [self createArrayFromOriginalArray:originalDict[key]];
        }
        
        if ([originalDict[key] conformityLevel] == kJSONCustom) {
            newDict[key] = [originalDict[key] dictionaryRepresentationOfObject ];
        }

        if ([originalDict[key] conformityLevel] == kJSONInvalid) {
            NSLog(@"invalid json object");
            return nil;
#warning what should I do here, throw an exception?
        }

    } // end for each

    return newDict;
}

+(NSMutableArray *)createArrayFromOriginalArray:(NSArray *)originalArray {
    
    NSMutableArray *newArray = [NSMutableArray array];
    
    for (id element in originalArray) {
        
        if ([element conformityLevel] == kJSONStandard) {
            [newArray addObject:element];
        }
        
        if ([element conformityLevel] == kJSONDictionary) {
            [newArray addObject:[self createDictionaryFromOriginalDict:element]];
        }
        
        if ([element conformityLevel] == kJSONArray) {
            [newArray addObject:[self createArrayFromOriginalArray:element]];
        }
        
        if ([element conformityLevel] == kJSONCustom) {
            [newArray addObject:[element dictionaryRepresentationOfObject]];
        }
        
        if ([element conformityLevel] == kJSONInvalid) {
            NSLog(@"error invalid json processing array");
            return nil;
        }
    }
    return newArray;    
}


+(NSData *)dataWithCustomJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)error {

    id newObject;
    
    // if the top level object is an NSDictionary.
    if ([obj isKindOfClass:[NSDictionary class]]) {

        NSDictionary *originalDict = (NSDictionary *)obj;
        newObject = [self createDictionaryFromOriginalDict:originalDict];
        
    } else // end if dictionary    
    // if the top level object is an array.
    if ([obj isKindOfClass:[NSArray class]]) {
        
        NSArray *originalArray = (NSArray *)obj;
        newObject = [self createArrayFromOriginalArray:originalArray];
        
    } else {
        // else barf
        *error = [NSError errorWithDomain:@"WRONG CLASS root node" code:42 userInfo:nil];
        return nil;
    }

    NSError *jsonError;
    NSData *data = [NSJSONSerialization dataWithJSONObject:newObject options:opt error:&jsonError];
    if  (jsonError) {
        *error = jsonError;
        return nil;
    }
    return data;
}


@end
