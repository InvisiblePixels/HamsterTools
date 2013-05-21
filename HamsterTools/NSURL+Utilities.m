//
//  NSURL+Utilities.m
//  HamsterTools
//
//  Created by Helen McManus on 25/10/12.
//  Copyright (c) 2012 InvisiblePixels. All rights reserved.
//

#import "NSURL+Utilities.h"

@implementation NSURL (Utilities)

-(NSDictionary *)breakdownURL:(NSURL *)url {
    
    return @{    
    @"absoluteString" : [url absoluteString],
    @"absoluteURL" : [url absoluteURL],
    @"baseURL" : [url baseURL],
    @"fragment" : [url fragment],
    @"host" : [url host],
    @"lastPathComponent" : [url lastPathComponent],
    @"parameterString" : [url parameterString],
    @"password" : [url password],
    @"path" : [url path],
    @"pathComponents" : [url pathComponents],
    @"pathExtension" : [url pathExtension],
    @"port" : [url port],
    @"query" : [url query],
    @"relativePath" : [url relativePath],
    @"relativeString" : [url relativeString],
    @"resourceSpecifier" : [url resourceSpecifier],
    @"scheme" : [url scheme],
    @"standardizedURL" : [url standardizedURL],
    @"user" : [url user]
    
    };
}
@end
