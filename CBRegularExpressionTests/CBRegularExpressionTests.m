//
//  CBRegularExpressionTests.m
//  CBRegularExpressionTests
//
//  Created by Henry on 3/12/14.
//  Copyright (c) 2014 Cloudbay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CBRegularExpression.h"
@interface CBRegularExpressionTests : XCTestCase {
    CBRegularExpression *re;
}

@end

@implementation CBRegularExpressionTests

- (void)setUp
{
    [super setUp];
    re = [CBRegularExpression regularExpressionWithPattern:@"([0-9]+)"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    re = nil;
}

- (void)testExample
{
    NSArray *group;
    BOOL match = [re match:@"abc456" group:&group];
    NSLog(@"Group:  %@",group);
    NSArray *group2;
    BOOL search = [re search:@"123abc456" group:&group2];
    NSLog(@"Search: %@", group2);
    NSArray *group3;
    BOOL match2 = [re match:@"12345" group:&group3];
    NSLog(@"Group2: %@", group3);
    XCTAssertTrue(match, @"Match1 is false");
    XCTAssertTrue(search, @"Search is false");
    XCTAssertTrue(match2, @"Match2 is false");
    
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
