//
//  Moto.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "Moto.h"
#import "Vehicle_Protected.h"

@implementation Moto

#pragma mark - Initialization

+ (instancetype)motoWithModel:(NSString *)model
                      concern:(NSString *)concern
                         type:(NSString *)type
                     photoURL:(NSURL *)photoURL
                        photo:(UIImage *)photo {
    return [[Moto alloc] initWithModel:model concern:concern type:type photoURL:photoURL photo:photo];
}

@end
