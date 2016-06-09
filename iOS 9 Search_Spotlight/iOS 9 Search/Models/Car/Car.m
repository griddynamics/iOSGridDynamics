//
//  Car.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/23/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "Car.h"
#import "Vehicle_Protected.h"

@implementation Car

#pragma mark - Initialization

+ (instancetype)carWithModel:(NSString *)model
                     concern:(NSString *)concern
                        type:(NSString *)type
                    photoURL:(NSURL *)photoURL
                       photo:(UIImage *)photo {
    return [[Car alloc] initWithModel:model concern:concern type:type photoURL:photoURL photo:photo];
}

@end
