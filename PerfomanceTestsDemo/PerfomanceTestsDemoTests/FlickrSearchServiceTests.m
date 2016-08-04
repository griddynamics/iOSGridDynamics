//
//  FlickrSearchServiceTests.m
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 14/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FlickrSearchService.h"

@interface FlickrSearchServiceTests : XCTestCase

@property (nonatomic) FlickrSearchService *objectUnderTest;

@end

@implementation FlickrSearchServiceTests

- (void)testSearchImages {
    [self measureMetrics:[XCTestCase defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        XCTestExpectation *expectation = [self expectationWithDescription:@"Wait answer from server"];
        [self startMeasuring];
        [FlickrSearchService imagesBySearchPhrase:@"cats" succes:^(NSArray *images) {
            [self stopMeasuring];
            [expectation fulfill];
        } failure:^(NSError *error) {
            XCTFail(@"Service failed to answer");
        }];
        [self waitForExpectationsWithTimeout:20 handler:nil];
    }];
}

@end
