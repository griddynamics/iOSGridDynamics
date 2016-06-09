//
//  Moto.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "Vehicle.h"

@interface Moto : Vehicle

+ (instancetype)motoWithModel:(NSString *)model
                      concern:(NSString *)concern
                         type:(NSString *)type
                     photoURL:(NSURL *)photoURL
                        photo:(UIImage *)photo;

@end
