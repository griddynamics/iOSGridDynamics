//
//  ALInCodeViewController.m
//  AutolayoutExample
//
//  Created by Alexandr Gaidukov on 13.06.16.
//  Copyright © 2016 Alexandr Gaidukov. All rights reserved.
//

#import "ALInCodeViewController.h"

@interface ALInCodeViewController ()

@property(nonatomic, strong) UIView *topLeftView;
@property(nonatomic, strong) UIView *topRightView;
@property(nonatomic, strong) UIView *bottomView;

@end

@implementation ALInCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self createViews];
    [self createViewsWithAncor];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
        self.topLeftView.backgroundColor = [UIColor redColor];
    } else {
        self.topLeftView.backgroundColor = [UIColor greenColor];
    }
}

- (void)createViews {
    self.topLeftView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topLeftView.backgroundColor = [UIColor greenColor];
    
    self.topRightView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topRightView.backgroundColor = [UIColor yellowColor];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.topLeftView];
    [self.view addSubview:self.topRightView];
    [self.view addSubview:self.bottomView];
    
    self.topLeftView.translatesAutoresizingMaskIntoConstraints = false;
    self.topRightView.translatesAutoresizingMaskIntoConstraints = false;
    self.bottomView.translatesAutoresizingMaskIntoConstraints = false;
    
    // Dimensions
    
    NSLayoutConstraint* widthConstraint12 = [NSLayoutConstraint
                                             constraintWithItem:self.topLeftView
                                             attribute:NSLayoutAttributeWidth
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:self.topRightView
                                             attribute:NSLayoutAttributeWidth
                                             multiplier:1.0
                                             constant:0.0];
    
    NSLayoutConstraint* heightConstraint12 = [NSLayoutConstraint
                                              constraintWithItem:self.topLeftView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.topRightView
                                              attribute:NSLayoutAttributeHeight
                                              multiplier:1.0
                                              constant:0.0];
    
    NSLayoutConstraint* heightConstraint13 = [NSLayoutConstraint
                                              constraintWithItem:self.topLeftView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.bottomView
                                              attribute:NSLayoutAttributeHeight
                                              multiplier:1.0
                                              constant:0.0];
    
    [self.view addConstraints:@[widthConstraint12, heightConstraint12, heightConstraint13]];
    
    // Top Left view
    
    NSLayoutConstraint* topOffset1 = [NSLayoutConstraint
                                      constraintWithItem:self.topLeftView
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0
                                      constant:20.0];
    
    NSLayoutConstraint* leftOffset1 = [NSLayoutConstraint
                                       constraintWithItem:self.topLeftView
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0
                                       constant:20.0];
    
    [self.view addConstraints:@[leftOffset1, topOffset1]];
    
    // Top Right view
    
    NSLayoutConstraint* rightOffset2 = [NSLayoutConstraint
                                        constraintWithItem:self.view
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.topRightView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                        constant:20.0];
    
    NSLayoutConstraint* topOffset2 = [NSLayoutConstraint
                                      constraintWithItem:self.topRightView
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.topLeftView
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0
                                      constant:0.0];
    
    NSLayoutConstraint* offset12 = [NSLayoutConstraint
                                    constraintWithItem:self.topRightView
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.topLeftView
                                    attribute:NSLayoutAttributeTrailing
                                    multiplier:1.0
                                    constant:20.0];
    
    [self.view addConstraints:@[rightOffset2, topOffset2, offset12]];
    
    // Bottom View
    
    NSLayoutConstraint* topOffset3 = [NSLayoutConstraint
                                      constraintWithItem:self.bottomView
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.topLeftView
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1.0
                                      constant:20.0];
    
    NSLayoutConstraint* leftOffset3 = [NSLayoutConstraint
                                       constraintWithItem:self.bottomView
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0
                                       constant:20.0];
    
    NSLayoutConstraint* rightOffset3 = [NSLayoutConstraint
                                        constraintWithItem:self.view
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.bottomView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                        constant:20.0];
    
    NSLayoutConstraint* bottomOffset3 = [NSLayoutConstraint
                                         constraintWithItem:self.view
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.bottomView
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1.0
                                         constant:20.0];
    
    [self.view addConstraints:@[topOffset3, leftOffset3, bottomOffset3, rightOffset3]];
    
}

- (void)createViewsWithAncor {
    self.topLeftView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topLeftView.backgroundColor = [UIColor greenColor];
    
    self.topRightView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topRightView.backgroundColor = [UIColor yellowColor];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.topLeftView];
    [self.view addSubview:self.topRightView];
    [self.view addSubview:self.bottomView];
    
    self.topLeftView.translatesAutoresizingMaskIntoConstraints = false;
    self.topRightView.translatesAutoresizingMaskIntoConstraints = false;
    self.bottomView.translatesAutoresizingMaskIntoConstraints = false;
    
    // Add constraints
    
    [self.topLeftView.widthAnchor constraintEqualToAnchor:self.topRightView.widthAnchor constant:0.0].active = true;
    [self.topLeftView.heightAnchor constraintEqualToAnchor:self.topRightView.heightAnchor constant:0.0].active = true;
    [self.topLeftView.heightAnchor constraintEqualToAnchor:self.bottomView.heightAnchor constant:0.0].active = true;
    
    [self.topLeftView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20.0].active = true;
    [self.topLeftView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0].active = true;
    
    [self.topRightView.topAnchor constraintEqualToAnchor:self.topLeftView.topAnchor constant:0.0].active = true;
    [self.view.trailingAnchor constraintEqualToAnchor:self.topRightView.trailingAnchor constant:20.0].active = true;
    [self.topRightView.leadingAnchor constraintEqualToAnchor:self.topLeftView.trailingAnchor constant:20.0].active = true;
    
    [self.bottomView.topAnchor constraintEqualToAnchor:self.topLeftView.bottomAnchor constant:20.0].active = true;
    [self.view.trailingAnchor constraintEqualToAnchor:self.bottomView.trailingAnchor constant:20.0].active = true;
    [self.bottomView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0].active = true;
    [self.view.bottomAnchor constraintEqualToAnchor:self.bottomView.bottomAnchor constant:20.0].active = true;
}

@end
