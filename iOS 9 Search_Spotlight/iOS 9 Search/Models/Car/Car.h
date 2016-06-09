//
//  Car.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/23/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "Vehicle.h"

@interface Car : Vehicle

+ (instancetype)carWithModel:(NSString *)model
                     concern:(NSString *)concern
                        type:(NSString *)type
                    photoURL:(NSURL *)photoURL
                       photo:(UIImage *)photo;

@end
