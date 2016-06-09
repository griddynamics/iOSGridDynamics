//
//  MotosProviderProtocol.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Moto;

@protocol MotosProviderProtocol <NSObject>

- (NSArray<Moto *> *)motos;

@end
