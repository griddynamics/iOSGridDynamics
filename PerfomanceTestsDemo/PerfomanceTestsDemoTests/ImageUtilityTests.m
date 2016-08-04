//
//  ImageUtilityTests.m
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 14/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ImageUtility.h"
#import "FlickrSearchService.h"

@interface ImageUtilityTests : XCTestCase

@property (nonatomic) ImageUtility *objectUnderTest;

@end

@implementation ImageUtilityTests

- (void)setUp {
    [super setUp];
    self.objectUnderTest = [[ImageUtility alloc] init];
}


- (void)testImageDownload {
    NSString *url = @"http://farm9.staticflickr.com/8697/27791093164_5b0b335781_m.jpg";
    [self measureMetrics:[XCTestCase defaultPerformanceMetrics]  automaticallyStartMeasuring:NO forBlock:^{
        XCTestExpectation *expectation = [self expectationWithDescription:@"Download image"];
        [self startMeasuring];
        [self.objectUnderTest loadImageFromUrl:url completion:^(UIImage *image) {
            if (image) {
                [self stopMeasuring];
                [expectation fulfill];
            }
            else {
                XCTFail(@"Image was not downloaded");
            }
        }];
        [self waitForExpectationsWithTimeout:20 handler:nil];
    }];
}

@end
