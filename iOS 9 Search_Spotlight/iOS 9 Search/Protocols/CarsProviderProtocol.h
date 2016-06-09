//
//  CarsProviderProtocol.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/23/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@protocol CarsProviderProtocol <NSObject>

- (NSArray<Car *> *)cars;

@end
