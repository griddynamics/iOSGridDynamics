//
//  SpotlightMotosIndexableProtocol.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Moto;

@protocol SpotlightMotosIndexableProtocol <NSObject>

+ (Moto *)motoWithSearchableItemID:(NSString *)itemID fromList:(NSArray<Moto *> *)motos;
- (void)indexMotos:(NSArray<Moto *> *)motos;

@end
