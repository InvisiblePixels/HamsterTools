//
//  StringTests.m
//  HamsterTools
//
//  Created by Helen McManus on 12/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Utils.h"
#import "NSString+ReverseEnum.h"

@interface StringTests : XCTestCase

@end

@implementation StringTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReverse {
    
    NSString *originalString = @"abcdefg";
    NSString *reversedString = @"gfedcba";
    NSString *reckonedReverseString = [originalString tac];
    NSString *altReckoned = [originalString reverseString];
    
    XCTAssertTrue([reversedString isEqualToString:reckonedReverseString], @"rev: %@, orig: %@, shouldbe: %@", reckonedReverseString, originalString, reversedString);
    
    XCTAssertTrue([reversedString isEqualToString:altReckoned], @"rev: %@, orig: %@, shouldbe: %@", altReckoned, originalString, reversedString);

}

- (void)testReverseEnum {
    
    XCTAssertTrue([@"UIInterfaceOrientationPortrait" isEqualToString:[NSString reverseUIInterfaceOrientation:UIDeviceOrientationPortrait] ], @"reverse enum false");
}

@end
