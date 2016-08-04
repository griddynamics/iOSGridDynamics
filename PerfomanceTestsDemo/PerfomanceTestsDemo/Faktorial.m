//
//  Faktorial.m
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 08/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import "Faktorial.h"
#include <stdlib.h>

long cache [60];

@interface Faktorial ()

@end

@implementation Faktorial


-(void)calculateRandomFactorialTimes:(NSUInteger)times {
    for (int i = 0; i < times; i++) {
        int number = arc4random_uniform(50);
        long factorial;
        factorial = cache[number];
        if (factorial == 0) {
            factorial = [self factorial:number];
            cache[number] = factorial;
        }
    }
}

- (long)factorial:(int)number {
    long result = 1;
    for (; number > 0; number--) {
        result *= number;
    }
    return result;
}

@end
