//
//  ColourTests.m
//  HamsterTools
//
//  Created by Helen McManus on 2/08/13.
//  Copyright (c) 2013 InvisiblePixels. All rights reserved.
//

/* It is IMPERATIVE that the testing target has -ObjC as "other compiler flags" set.
 * Also, don't forget to include UIKit :)
 */


#import <XCTest/XCTest.h>
#import "HamsterTools.h"

@interface ColourTests : XCTestCase

@end

@implementation ColourTests

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

- (void)testColourCreationComponents {
    
    
    UIColor *myWhiteColour = [UIColor colourWithRed:0xff green:0xff blue:0xff alpha:0.0];
    XCTAssertEqualObjects(myWhiteColour, [UIColor colorWithRed:1 green:1 blue:1 alpha:0], @"I created white!");
    
    UIColor *myBlueColour = [UIColor colourWithRed:0x00 green:0x00 blue:0xff alpha:0.0];
    XCTAssertEqualObjects(myBlueColour, [UIColor colorWithRed:0 green:0 blue:1 alpha:0], @"I created blue!");
    
}

- (void)testColourInteger {
    
    UIColor *my123456 = [UIColor colourWithInteger:0x123456 alpha:0];
    XCTAssertEqualObjects(my123456, [UIColor colourWithRed:0x12 green:0x34 blue:0x56 alpha:0], @"I made a colour");
}

@end
