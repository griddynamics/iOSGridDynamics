//
//  CarsVC.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/23/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CarsProviderProtocol;

@interface CarsVC : UITableViewController

@property (nonatomic) id<CarsProviderProtocol> carsProvider;

@end
