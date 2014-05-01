//
//  NSString+ReverseEnum.m
//  HamsterTools
//
//  Created by Hamster on 27/03/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//


#import "NSString+ReverseEnum.h"

@implementation NSString (ReverseEnum)

+(NSString *)reverseUIRemoteNotificationType:(NSInteger)rnt {
    
    NSLog(@"Received int: %ld", (long)rnt);
    
    if (rnt == 0) {
        return @"UIRemoteNotificationTypeNone";
    }
    
    //  NSJSONSerialization+CustomObjectSerialisation.h
    NSMutableString *string = [NSMutableString stringWithString:@"\n"];
    if ((unsigned)rnt & UIRemoteNotificationTypeBadge) {
        [string appendString:@"UIRemoteNotificationTypeBadge\n"];
    }
    if ((unsigned)rnt & UIRemoteNotificationTypeSound) {
        [string appendString:@"UIRemoteNotificationTypeSound\n"];
    }
    if ((unsigned)rnt & UIRemoteNotificationTypeAlert) {
        [string appendString:@"UIRemoteNotificationTypeAlert\n"];
    }
    if ((unsigned)rnt & UIRemoteNotificationTypeNewsstandContentAvailability) {
        [string appendString:@"UIRemoteNotificationTypeNewsstandContentAvailability\n"];
    }
    
    // Remove the trailing \n - simply for aesthetics
    [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
    
    return string;
    
}

+(NSString *)reverseCFStreamStatus:(NSInteger)status {
    
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

+(NSString *)reverseCFStreamEventType:(NSInteger)event {
    
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

+(NSString *)reverseUIApplicationState:(NSInteger)state {
    
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
            string = [NSString stringWithFormat:@"Unknown state: %ld", (long)state];
            break;
    }
    return string;
}

+(NSString *)reverseUIInterfaceOrientation:(NSInteger)orientation {
    
    NSString *string;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            string = @"UIInterfaceOrientationPortrait";
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            string = @"UIInterfaceOrientationPortraitUpsideDown";
            break;
            
        case UIDeviceOrientationLandscapeRight:
            string = @"UIInterfaceOrientationLandscapeLeft";
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            string = @"UIInterfaceOrientationLandscapeRight";
            break;
            
        default:
            string = @"";
            break;
    }
    
    return string;
}

+(NSString *)reverseSCNetworkReachabilityFlags:(SCNetworkReachabilityFlags)flags {
    
    NSMutableString *string = [NSMutableString string];
    
    /*
     kSCNetworkReachabilityFlagsConnectionAutomatic    = kSCNetworkReachabilityFlagsConnectionOnTraffic
     */
    
    if (flags & 1 << 0) {
        [string appendString:@"kSCNetworkReachabilityFlagsTransientConnection | "];
    }
    if (flags & 1 << 1) {
        [string appendString:@"kSCNetworkReachabilityFlagsReachable | "];
    }
    if (flags & 1 << 2) {
        [string appendString:@"kSCNetworkReachabilityFlagsConnectionRequired | "];
    }
        
    if (flags & 1 << 3) {
        [string appendString:@"kSCNetworkReachabilityFlagsConnectionOnTraffic | "];
    }
            
    if (flags & 1 << 4) {
        [string appendString:@"kSCNetworkReachabilityFlagsInterventionRequired | "];
    }
                
    if (flags & 1 << 5) {
        [string appendString:@"kSCNetworkReachabilityFlagsConnectionOnDemand | "];
    }
                    
    if (flags & 1 << 16) {
        [string appendString:@"kSCNetworkReachabilityFlagsIsLocalAddress | "];
    }
                        
    if (flags & 1 << 17) {
        [string appendString:@"kSCNetworkReachabilityFlagsIsDirect | "];
    }
    if (flags & 1 << 18) {
        [string appendString:@"kSCNetworkReachabilityFlagsIsWWAN | "];
    }
    
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"| "]];

}


+(NSString *)reverseCGBlendMode:(CGBlendMode)blendMode {
    
   
    NSArray *array = @[
                       @"kCGBlendModeNormal",
                       @"kCGBlendModeMultiply",
                       @"kCGBlendModeScreen",
                       @"kCGBlendModeOverlay",
                       @"kCGBlendModeDarken",
                       @"kCGBlendModeLighten",
                       @"kCGBlendModeColorDodge",
                       @"kCGBlendModeColorBurn",
                       @"kCGBlendModeSoftLight",
                       @"kCGBlendModeHardLight",
                       @"kCGBlendModeDifference",
                       @"kCGBlendModeExclusion",
                       @"kCGBlendModeHue",
                       @"kCGBlendModeSaturation",
                       @"kCGBlendModeColor",
                       @"kCGBlendModeLuminosity",
                       @"kCGBlendModeClear",
                       @"kCGBlendModeCopy",
                       @"kCGBlendModeSourceIn",
                       @"kCGBlendModeSourceOut",
                       @"kCGBlendModeSourceAtop",
                       @"kCGBlendModeDestinationOver",
                       @"kCGBlendModeDestinationIn",
                       @"kCGBlendModeDestinationOut",
                       @"kCGBlendModeDestinationAtop",
                       @"kCGBlendModeXOR",
                       @"kCGBlendModePlusDarker",
                       @"kCGBlendModePlusLighter"];
    
    if (blendMode < array.count) {
        return array[blendMode];
    } else {
        return [NSString stringWithFormat:@"Blend mode %d invalid.", blendMode];
    }

    
}


@end
