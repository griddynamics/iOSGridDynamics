//
//  ALPropertiesViewController.m
//  AutolayoutExample
//
//  Created by Alexandr Gaidukov on 13.06.16.
//  Copyright © 2016 Alexandr Gaidukov. All rights reserved.
//

#import "ALPropertiesViewController.h"

@interface ALPropertiesViewController ()

@property(nonatomic, weak) IBOutlet UIView* topView;

- (IBAction)hideButtonTapped:(id)sender;

@end

@implementation ALPropertiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)hideButtonTapped:(id)sender {
    [self.topView removeFromSuperview];
}

@end
