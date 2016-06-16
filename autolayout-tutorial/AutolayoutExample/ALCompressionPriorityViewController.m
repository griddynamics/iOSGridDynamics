//
//  ALCompressionPriorityViewController.m
//  AutolayoutExample
//
//  Created by Alexandr Gaidukov on 14.06.16.
//  Copyright © 2016 Alexandr Gaidukov. All rights reserved.
//

#import "ALCompressionPriorityViewController.h"
#import "ALLabel.h"

@interface ALCompressionPriorityViewController ()

@property(nonatomic, weak) IBOutlet ALLabel* label;

- (IBAction)goTapped:(id)sender;

@end

@implementation ALCompressionPriorityViewController

- (IBAction)goTapped:(id)sender {
    self.label.offsetSize = CGSizeMake(0.0, 100.0);
    [self.label invalidateIntrinsicContentSize];
}

@end
