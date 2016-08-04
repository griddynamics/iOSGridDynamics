//
//  PerfomanceTestsDemoTests.m
//  PerfomanceTestsDemoTests
//
//  Created by Diana Evlakhova on 08/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Faktorial.h"

@interface PerfomanceTestsDemoTests : XCTestCase

@property (nonatomic) Faktorial *objectUnderTest;

@end

@implementation PerfomanceTestsDemoTests

- (void)setUp {
    [super setUp];
    self.objectUnderTest = [[Faktorial alloc] init];
}

- (void)testPerformance5 {
    
    [self measureBlock:^{
        [self.objectUnderTest calculateRandomFactorialTimes:1000000];
    }];
}




@end
