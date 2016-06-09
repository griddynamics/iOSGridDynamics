//
//  CarsVC.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/23/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "CarsVC.h"
#import "CarsProviderProtocol.h"
#import "CarDetailsVC.h"
#import "SpotlightDataIndexator.h"
#import "Car.h"

@import CoreSpotlight;

@interface CarsVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CarsVC

#pragma mark - UIResponder

- (void)restoreUserActivityState:(NSUserActivity *)activity {
    if ([activity.activityType isEqualToString:CSSearchableItemActionType]) {
        NSString *searchableItemID = activity.userInfo[CSSearchableItemActivityIdentifier];
        Car *selectedCar = [SpotlightDataIndexator carWithSearchableItemID:searchableItemID fromList:_carsProvider.cars];
        [self showCarDetailsWithCar:selectedCar animated:NO];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _carsProvider.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    Car *car = self.carsProvider.cars[[indexPath row]];
    
    cell.imageView.image = car.photo;
    cell.textLabel.text = [car title];
    cell.detailTextLabel.text = car.type;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showCarDetailsWithCar:self.carsProvider.cars[[indexPath row]] animated:YES];
}

- (void)showCarDetailsWithCar:(Car *)car animated:(BOOL)animated {
    if (car) {
        [[self tabBarController] setSelectedIndex:0];
        [[self navigationController] popToRootViewControllerAnimated:NO];
        
        CarDetailsVC *carDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CarDetailsVC class])];
        carDetailsVC.car = car;
        
        [self.navigationController pushViewController:carDetailsVC animated:animated];
    }
}

@end
