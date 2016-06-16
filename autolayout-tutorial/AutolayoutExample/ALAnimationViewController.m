//
//  ALAnimationViewController.m
//  AutolayoutExample
//
//  Created by Alexandr Gaidukov on 14.06.16.
//  Copyright © 2016 Alexandr Gaidukov. All rights reserved.
//

#import "ALAnimationViewController.h"

@interface ALAnimationViewController ()

@property(nonatomic, weak) IBOutlet NSLayoutConstraint* topConstraint;
@property(nonatomic, weak) IBOutlet NSLayoutConstraint* leftConstraint;
@property(nonatomic, weak) IBOutlet NSLayoutConstraint* rightConstraint;
@property(nonatomic, weak) IBOutlet NSLayoutConstraint* bottomConstraint;

- (IBAction)animateTapped:(id)sender;

@end

@implementation ALAnimationViewController

- (IBAction)animateTapped:(id)sender {
    UILayoutPriority topPriority = self.topConstraint.priority;
    UILayoutPriority leftPriority = self.leftConstraint.priority;
    
    self.topConstraint.priority = self.bottomConstraint.priority;
    self.leftConstraint.priority = self.rightConstraint.priority;
    self.bottomConstraint.priority = topPriority;
    self.rightConstraint.priority = leftPriority;
    
    [UIView animateWithDuration:2.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
