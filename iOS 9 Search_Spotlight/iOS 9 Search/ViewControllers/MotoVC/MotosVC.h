//
//  MotoVC.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MotosProviderProtocol;

@interface MotosVC : UITableViewController

@property (nonatomic) id<MotosProviderProtocol> motosProvider;

@end
