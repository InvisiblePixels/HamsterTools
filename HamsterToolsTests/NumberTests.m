//
//  NumberTests.m
//  HamsterTools
//
//  Created by Helen McManus on 11/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+Utils.h"

@interface NumberTests : XCTestCase

@end

@implementation NumberTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}


- (void)testBinaryNumberString {
    
    NSString *result = @"10011";
    NSString *reckonedString = NSStringFromNumberInBinaryFormat(19);
    
    XCTAssertTrue([result isEqualToString:reckonedString], @"%@ %@", result, reckonedString);
    
    
}

- (void)testShiftAndKeep {
    
    int originalNumber = 19;
    int keptBits[5] = {1,1,0,0,1};
    int shorterNum[5] = {9,4,2,1,0};
    
    int newNumber;
    int keepBit;
    
    newNumber = shiftAndKeep(originalNumber, &keepBit); // 1 and 9
    XCTAssertTrue(newNumber == shorterNum[0], @"New Num: %d", newNumber);
    XCTAssertTrue(keepBit == keptBits[0], @"Kept: %d %d", keepBit, keptBits[0]);
    
    newNumber = shiftAndKeep(newNumber, &keepBit);
    XCTAssertTrue(newNumber == shorterNum[1], @"New Num: %d", newNumber);
    XCTAssertTrue(keepBit == keptBits[1], @"Kept: %d %d", keepBit, keptBits[1]);
    
    newNumber = shiftAndKeep(newNumber, &keepBit);
    XCTAssertTrue(newNumber == shorterNum[2], @"New Num: %d", newNumber);
    XCTAssertTrue(keepBit == keptBits[2], @"Kept: %d %d", keepBit, keptBits[2]);
    
    newNumber = shiftAndKeep(newNumber, &keepBit);
    XCTAssertTrue(newNumber == shorterNum[3], @"New Num: %d", newNumber);
    XCTAssertTrue(keepBit == keptBits[3], @"Kept: %d %d", keepBit, keptBits[3]);
}

@end
