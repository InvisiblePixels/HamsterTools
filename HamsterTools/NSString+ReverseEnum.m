//
//  NSString+ReverseEnum.m
//  HamsterTools
//
//  Created by Hamster on 27/03/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//


#import "NSString+ReverseEnum.h"

@implementation NSString (ReverseEnum)

+(NSString *)reverseUIRemoteNotificationType:(int)rnt {
    
    NSLog(@"Received int: %d", rnt);
    
    if (rnt == 0) {
        return @"UIRemoteNotificationTypeNone";
    }
    
    //  NSJSONSerialization+CustomObjectSerialisation.h
    NSMutableString *string = [NSMutableString stringWithString:@"\n"];
    if (rnt & UIRemoteNotificationTypeBadge) {
        [string appendString:@"UIRemoteNotificationTypeBadge\n"];
    }
    if (rnt & UIRemoteNotificationTypeSound) {
        [string appendString:@"UIRemoteNotificationTypeSound\n"];
    }
    if (rnt & UIRemoteNotificationTypeAlert) {
        [string appendString:@"UIRemoteNotificationTypeAlert\n"];
    }
    if (rnt & UIRemoteNotificationTypeNewsstandContentAvailability) {
        [string appendString:@"UIRemoteNotificationTypeNewsstandContentAvailability\n"];
    }
    
    // Remove the trailing \n - simply for aesthetics
    [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
    
    return string;
    
}

+(NSString *)reverseCFStreamStatus:(int)status {
    
    switch (status) {
        case 0:
            return @"kCFStreamStatusNotOpen";
            break;
        case 1:
            return @"kCFStreamStatusOpening";
            break;
        case 2:
            return @"kCFStreamStatusOpen";
            break;
        case 3:
            return @"kCFStreamStatusReading";
            break;
        case 4:
            return @"kCFStreamStatusWriting";
            break;
        case 5:
            return @"kCFStreamStatusAtEnd";
            break;
        case 6:
            return @"kCFStreamStatusClosed";
            break;
        case 7:
            return @"kCFStreamStatusError";
            break;
            
        default:
            break;
    }
    return nil;    
}

+(NSString *)reverseCFStreamEventType:(int)event {
    
    NSString *string;
    switch (event) {
        case 0:
            string = @"kCFStreamEventNone";
            break;
        case 1:
            string = @"kCFStreamEventOpenCompleted";
            break;
        case 2:
            string = @"kCFStreamEventHasBytesAvailable";
            break;
        case 4:
            string = @"kCFStreamEventCanAcceptBytes";
            break;
        case 8:
            string = @"kCFStreamEventErrorOccurred";
            break;
        case 16:
            string = @"kCFStreamEventEndEncountered";
            break;
        
        default:
            NSAssert(1, @"SHOULD NEVER GET HERE");
            break;
    }
    return string;
}

+(NSString *)reverseUIApplicationState:(int)state {
    
    NSString *string;
    switch (state) {
        case 0:
            string = @"UIApplicationStateActive";
            break;
            
        case 1:
            string = @"UIApplicationStateInactive";
            break;
            
        case 2:
            string = @"UIApplicationStateBackground";
            break;
            
        default:
            string = [NSString stringWithFormat:@"Unknown state: %d", state];
            break;
    }
    return string;
}

@end
