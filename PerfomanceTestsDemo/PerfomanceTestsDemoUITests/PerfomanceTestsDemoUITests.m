//
//  PerfomanceTestsDemoUITests.m
//  PerfomanceTestsDemoUITests
//
//  Created by Diana Evlakhova on 08/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import <XCTest/XCTest.h>
#include <mach/mach_time.h>

@interface PerfomanceTestsDemoUITests : XCTestCase

@end

@implementation PerfomanceTestsDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    NSDate *startTime = [NSDate date];
    
    XCUIElement *searchbarElement = app.otherElements[@"searchBar"];
    XCUIElement *searchField = [searchbarElement childrenMatchingType:XCUIElementTypeSearchField].element;
    [searchField tap];
    
    
    [app typeText:@"cats\r"];
    
    XCUIElementQuery *collectionViewsQuery = app.collectionViews;
    
    
    XCUIElement *imgviewImage = [[collectionViewsQuery childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:3].images[@"ImgView"];
    [self waitForElementExists:imgviewImage timeout:20];
    
    [imgviewImage swipeUp];
    [imgviewImage swipeUp];
    
    
    XCUIElement *anotherImage = [[collectionViewsQuery childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:8].images[@"ImgView"];
    [self waitForElementExists:anotherImage timeout:20];
    
    [anotherImage swipeUp];
    
    [self waitForElementExists:[[collectionViewsQuery childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:4].images[@"ImgView"]
                       timeout:20];
    
    NSTimeInterval endTime = [[NSDate date] timeIntervalSinceDate:startTime];
    NSLog(@"Execution time %f", endTime);
    XCTAssertLessThan(endTime, 15);
    
}

- (void)waitForElementExists:(XCUIElement *)element timeout:(NSTimeInterval)timeout {
    [self expectationForPredicate:[NSPredicate predicateWithFormat:@"exists == 1"] evaluatedWithObject:element handler:nil];
    [self waitForExpectationsWithTimeout:timeout handler:nil];
}

@end
