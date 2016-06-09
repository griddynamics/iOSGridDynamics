//
//  DataGateway.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/23/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "DataGateway.h"
#import "Car.h"
#import "Moto.h"

@interface DataGateway ()

@property (nonatomic) NSArray<Car *> *cars;
@property (nonatomic) NSArray<Moto *> *motos;

@end

@implementation DataGateway

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self createCarsList];
        [self createMotosList];
    }
    
    return self;
}

#pragma mark - CarsProviderProtocol

- (NSArray<Car *> *)cars {
    return _cars;
}

#pragma mark - MotosProviderProtocol

- (NSArray<Moto *> *)motos {
    return _motos;
}

#pragma mark - Private

- (void)createCarsList {
    NSMutableArray<Car *> *cars = [NSMutableArray new];
    
    [cars addObject:[Car carWithModel:@"FH"
                              concern:@"Volvo"
                                 type:@"Truck"
                             photoURL:[NSURL URLWithString:@"http://www.volvotrucks.com/SiteCollectionImages/VTC/Market/Trucks/volvo-fh-series/Product-gallery/hi-res/new-volvo-fh16-exterior-highres-no750.jpg"]
                                photo:[UIImage imageNamed:@"volvo"]]];
    
    [cars addObject:[Car carWithModel:@"Huracán"
                              concern:@"Lamborghini"
                                 type:@"Sportcar"
                             photoURL:[NSURL URLWithString:@"http://pngimg.com/upload/small/lamborghini_PNG10683.png"]
                                photo:[UIImage imageNamed:@"lamborghini"]]];
    
    [cars addObject:[Car carWithModel:@"Ghibli"
                              concern:@"Maserati"
                                 type:@"Sedan"
                             photoURL:[NSURL URLWithString:@"http://spidercars.net/wp-content/uploads/images/2015-Maserati-Ghibli_1046.jpg"]
                                photo:[UIImage imageNamed:@"maserati"]]];
    
    [cars addObject:[Car carWithModel:@"Transporter"
                              concern:@"Volkswagen"
                                 type:@"Minivan"
                             photoURL:[NSURL URLWithString:@"http://s1.cdn.autoevolution.com/images/news/volkswagen-transporter-california-special-edition-announced-47236_1.jpg"]
                                photo:[UIImage imageNamed:@"volkswagen"]]];
    
    [cars addObject:[Car carWithModel:@"X6"
                              concern:@"BMW"
                                 type:@"Crossover"
                             photoURL:[NSURL URLWithString:@"http://img.autobytel.com/car-reviews/autobytel/124518-2015-bmw-x6-begins-the-second-era-of-the-crossover-coupe-thing/2015-BMW-X6.jpg"]
                                photo:[UIImage imageNamed:@"bmw"]]];
    
    self.cars = [cars copy];
}

- (void)createMotosList {
    NSMutableArray<Moto *> *motos = [NSMutableArray new];
    
    [motos addObject:[Moto motoWithModel:@"Diavel"
                                 concern:@"Ducati"
                                    type:nil
                                photoURL:nil
                                   photo:[UIImage imageNamed:@"ducati"]]];
    
    [motos addObject:[Moto motoWithModel:@"GT Tachyon"
                                 concern:@"Harley Davidson"
                                    type:nil
                                photoURL:nil
                                   photo:[UIImage imageNamed:@"harley"]]];
    
    self.motos = [motos copy];
}


@end
