//
//  NSJSONSerialization+CustomObjectSerialisation.m
//  HamsterTools
//
//  Created by Helen McManus on 14/04/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import "NSJSONSerialization+CustomObjectSerialisation.h"


@interface NSJSONSerialization (CustomObjectSerialisationPrivate)

+(void)processContainer:(id)cont;


@end

@implementation NSJSONSerialization (CustomObjectSerialisationPrivate)

+(void)processContainer:(id)cont {
    NSLog(@"process container");
    
    /* Iterate over each element in the container.
     The element is either going to be another container or a string.
     If it's a string, we can simply ignore it.
     If element contains an array, we just pass it back to this function.
     If element contains a hash, we check to see if it's an "object" hash or not. If an object hash, we replace it with an instantiated object.
     */

    if ([cont isKindOfClass:[NSArray class]]) {
        for (int i = 0; i < ([(NSArray *)cont count]); i++) {
            
            if ([cont[i] isKindOfClass:[NSArray class]]) {
                NSLog(@"element %d is array", i);
                // Recurse.
                [NSJSONSerialization processContainer:cont[i]];
                
            } else
                if ([cont[i] isKindOfClass:[NSDictionary class]]) {
                    NSLog(@"element %d is dictionary", i);
                    // Test to see if it's a isA or not.
                    if ([cont[i] valueForKey:@"isACustomJSONClassType"]) {
                        // Need to replace it with out object.
                        NSLog(@"it is an object");
    #warning need to raise exception if newobject is nil because class not found in the bundle? or let nil take its course.
                        id newClass = [[NSBundle mainBundle] classNamed:[cont[i] valueForKey:@"isACustomJSONClassType"]];
                        id<JSONSerialisable> newObject = [newClass objectFromDictionaryRepresentation:cont[i] ];
                        cont[i] = newObject;
                    } else {
                        // Is a normal hash, so recurse
                        NSLog(@"hash is not an object hash");
                        [NSJSONSerialization processContainer:cont[i]];
                    }
                } // end if dictionary
        } // end for
    } else
        if ([cont isKindOfClass:[NSDictionary class]]) {
            
            // Fast enum over a dictionary iterates over the KEYS, not the values.
            for (NSString *key in cont) {
                if ([cont[key] isKindOfClass:[NSArray class]]) {
                    NSLog(@"element %@ is array", key);
                    // Recurse.
                    [NSJSONSerialization processContainer:cont[key]];
                } else
                    if ([cont[key] isKindOfClass:[NSDictionary class]]) {
                        // Test to see if isA
                        if ([cont[key] valueForKey:@"isACustomJSONClassType"]) {
                            // Need to replace it with out object.
                            NSLog(@"it is an object");
#warning need to raise exception if newobject is nil because class not found in the bundle? or let nil take its course.
                            id newClass = [[NSBundle mainBundle] classNamed:[cont[key] valueForKey:@"isACustomJSONClassType"]];
                            id<JSONSerialisable> newObject = [newClass objectFromDictionaryRepresentation:cont[key] ];
                            cont[key] = newObject;
                        } else {
                            // Is a normal hash, so recurse
                            NSLog(@"hash is not an object hash");
                            [NSJSONSerialization processContainer:cont[key]];
                        }
                    }
            }
            
        } // end if dictionary
    
}



@end

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
            NSLog(@"here dict");
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[originalDict[key] dictionaryRepresentationOfObject]];
            dict[@"isACustomJSONClassType"] = NSStringFromClass([originalDict[key] class]);
            newDict[key] = dict;
#warning not tested and need verify valid json

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
#warning really need to sanity check the returned dictionary both here and in the array to make sure it's json-able (isJson?)
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[element dictionaryRepresentationOfObject]];
            dict[@"isACustomJSONClassType"] = NSStringFromClass([element class]);
            [newArray addObject:dict];
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



+(id)JSONObjectWithCustomData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)error {
    
    // Let's just put the data into an object. At this point we don't know what sort of object it is.
    // We know it has to be an array or dict (json says so)
    // Force mutable containers
    id birdOrPlane = [NSJSONSerialization JSONObjectWithData:data options:opt | NSJSONReadingMutableContainers error:error];
    
    [NSJSONSerialization processContainer:birdOrPlane];
    
    return birdOrPlane;
}


    
    
    


@end
