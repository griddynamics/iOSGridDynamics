//
//  CarDetailsVC.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/23/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "CarDetailsVC.h"
#import "Car.h"

@interface CarDetailsVC ()

@property (nonatomic) IBOutlet UIImageView *carImageView;
@property (nonatomic) IBOutlet UILabel     *titleLabel;
@property (nonatomic) IBOutlet UILabel     *carTypeLabel;

@end

@implementation CarDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.carImageView.image = self.car.photo;
    self.titleLabel.text = [self.car title];
    self.carTypeLabel.text = self.car.type;
}

@end
