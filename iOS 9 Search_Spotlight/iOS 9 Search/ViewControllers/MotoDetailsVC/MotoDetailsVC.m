//
//  MotoDetailsVC.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "MotoDetailsVC.h"
#import "Moto.h"

@interface MotoDetailsVC ()

@property (nonatomic) IBOutlet UIImageView *motoImageView;
@property (nonatomic) IBOutlet UILabel     *titleLabel;

@end

@implementation MotoDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.motoImageView.image = self.moto.photo;
    self.titleLabel.text = [self.moto title];
}

@end
