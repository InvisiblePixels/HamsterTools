//
//  ArrayTests.m
//  
//
//  Created by Helen McManus on 2/08/13.
//
//

#import <XCTest/XCTest.h>
#import "HamsterTools.h"

@interface ArrayTests : XCTestCase

@property (strong, nonatomic) NSArray *array;
@end

@implementation ArrayTests

+(void)setUp {
    NSLog(@"class setup");
}


-(NSArray *)array {
    
    if (! _array) {
        _array = @[@0, @1, @2];
    }
    return _array;
}

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

- (void)testArray {
    NSLog(@"self.array %@", self.array);
    XCTAssertTrue(self.array.count == 3, @"Three elements in the array");
}


@end
