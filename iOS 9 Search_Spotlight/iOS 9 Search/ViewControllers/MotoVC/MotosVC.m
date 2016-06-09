//
//  MotoVC.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "MotosVC.h"
#import "MotosProviderProtocol.h"
#import "Moto.h"
#import "SpotlightDataIndexator.h"
#import "MotoDetailsVC.h"

@import CoreSpotlight;

@interface MotosVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MotosVC

#pragma mark - UIResponder

- (void)restoreUserActivityState:(NSUserActivity *)activity {
    if ([activity.activityType isEqualToString:CSSearchableItemActionType]) {
        NSString *searchableItemID = activity.userInfo[CSSearchableItemActivityIdentifier];
        Moto *selectedMoto = [SpotlightDataIndexator motoWithSearchableItemID:searchableItemID fromList:_motosProvider.motos];
        [self showMotoDetailsWithMoto:selectedMoto animated:NO];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _motosProvider.motos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    Moto *moto = _motosProvider.motos[[indexPath row]];
    
    cell.imageView.image = moto.photo;
    cell.textLabel.text = [moto title];
    cell.detailTextLabel.text = moto.type;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showMotoDetailsWithMoto:_motosProvider.motos[[indexPath row]] animated:YES];
}

- (void)showMotoDetailsWithMoto:(Moto *)moto animated:(BOOL)animated {
    if (moto) {
        [[self tabBarController] setSelectedIndex:1];
        [[self navigationController] popToRootViewControllerAnimated:NO];
        
        MotoDetailsVC *motoDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MotoDetailsVC class])];
        motoDetailsVC.moto = moto;
        
        [self.navigationController pushViewController:motoDetailsVC animated:animated];
    }
}

@end
