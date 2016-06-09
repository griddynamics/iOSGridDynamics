//
//  SpotlightDataIndexator.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/24/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "SpotlightDataIndexator.h"
#import "Car.h"
#import "Moto.h"

static NSString *const kTypeCar           = @"Car";
static NSString *const kUniqueIDPrefixCar = @"UniqueIDCar";
static NSString *const kDomainIDCar       = @"DomainIDCar";

static NSString *const kTypeMoto            = @"Moto";
static NSString *const kUniqueIDPrefixMoto  = @"UniqueIDMoto";
static NSString *const kDomainIDMoto        = @"DomainIDMoto";

@import CoreSpotlight;
@import MobileCoreServices;
@import Contacts;

@implementation SpotlightDataIndexator

#pragma mark - SpotlightCarsIndexableProtocol

+ (Car *)carWithSearchableItemID:(NSString *)itemID fromList:(NSArray<Car *> *)cars {
    Car *car;
    
    if ([itemID hasPrefix:kUniqueIDPrefixCar]) {
        NSUInteger selectedCarIndex = [[itemID substringFromIndex:[kUniqueIDPrefixCar length]] integerValue];
        car = cars[selectedCarIndex];
    }
    
    return car;
}

- (void)indexCars:(NSArray<Car *> *)cars {
    NSMutableArray<CSSearchableItem *> *searchableItems = [[NSMutableArray alloc] initWithCapacity:cars.count];
    
    for (Car *car in cars) {
        CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:kTypeCar];
        attributeSet.title = [car title];
        attributeSet.thumbnailData = UIImagePNGRepresentation(car.photo);
        attributeSet.contentDescription = car.type;
        attributeSet.keywords = @[car.model, car.concern, car.type];
        
        NSString *uniqueID = [NSString stringWithFormat:@"%@%lu", kUniqueIDPrefixCar, (unsigned long)[cars indexOfObject:car]];
        
        CSSearchableItem *searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:uniqueID
                                                                             domainIdentifier:kDomainIDCar
                                                                                 attributeSet:attributeSet];
        
        [searchableItems addObject:searchableItem];
    }
    
    [searchableItems addObject:[self driverSearchableItem]];
    
    
    CSSearchableIndex *searchableIndex = [[CSSearchableIndex alloc] initWithName:@"foo"];
    
    [searchableIndex indexSearchableItems:searchableItems
                        completionHandler:^(NSError * _Nullable error) {
                            if (error) { // CSIndexErrorCode error types
                                NSLog(@"%@", error.localizedDescription);
                            }
                        }];
}

#pragma mark - SpotlightMotosIndexableProtocol

+ (Moto *)motoWithSearchableItemID:(NSString *)itemID fromList:(NSArray<Moto *> *)motos {
    Moto *moto;
    
    if ([itemID hasPrefix:kUniqueIDPrefixMoto]) {
        NSUInteger selectedMotoIndex = [[itemID substringFromIndex:[kUniqueIDPrefixMoto length]] integerValue];
        moto = motos[selectedMotoIndex];
    }
    
    return moto;
}

- (void)indexMotos:(NSArray<Moto *> *)motos {
    NSMutableArray<CSSearchableItem *> *searchableItems = [[NSMutableArray alloc] initWithCapacity:motos.count];
    
    for (Moto *moto in motos) {
        CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:kTypeMoto];
        attributeSet.title = [moto title];
        attributeSet.thumbnailData = UIImagePNGRepresentation(moto.photo);
        attributeSet.keywords = @[moto.model, moto.concern];
        
        NSString *uniqueID = [NSString stringWithFormat:@"%@%lu", kUniqueIDPrefixMoto, (unsigned long)[motos indexOfObject:moto]];
        
        CSSearchableItem *searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:uniqueID
                                                                             domainIdentifier:kDomainIDMoto
                                                                                 attributeSet:attributeSet];
        
        [searchableItems addObject:searchableItem];
    }
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItems
                                                   completionHandler:^(NSError * _Nullable error) {
                                                       if (error) { // CSIndexErrorCode error types
                                                           NSLog(@"%@", error.localizedDescription);
                                                       }
                                                   }];
}

#pragma mark - Private

- (CSSearchableItem *)driverSearchableItem {
    NSString *phoneNumber = @"+123456789";
    
    CSLocalizedString *displayName = [[CSLocalizedString alloc] initWithLocalizedStrings:@{ @"en": @"Theptai Intathep",
                                                                                            @"ru": @"Иван Петров" }];
    
    CSPerson *person = [[CSPerson alloc] initWithDisplayName:displayName.localizedString
                                                     handles:@[phoneNumber]
                                            handleIdentifier:CNContactPhoneNumbersKey];
    
    CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:kTypeCar];
    attributeSet.supportsPhoneCall = @1;
    attributeSet.phoneNumbers = @[phoneNumber];
    attributeSet.authors = @[person];
    
    return [[CSSearchableItem alloc] initWithUniqueIdentifier:@"foo"
                                             domainIdentifier:kDomainIDCar
                                                 attributeSet:attributeSet];
}

@end
