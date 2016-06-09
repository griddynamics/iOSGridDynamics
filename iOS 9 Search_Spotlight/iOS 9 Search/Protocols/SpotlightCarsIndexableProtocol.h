//
//  SpotlightCarsIndexableProtocol.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/24/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@protocol SpotlightCarsIndexableProtocol <NSObject>

+ (Car *)carWithSearchableItemID:(NSString *)itemID fromList:(NSArray<Car *> *)cars;
- (void)indexCars:(NSArray<Car *> *)cars;

@end
