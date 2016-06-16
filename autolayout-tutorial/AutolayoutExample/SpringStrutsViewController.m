//
//  DetailViewController.m
//  AutolayoutExample
//
//  Created by Alexandr Gaidukov on 13.06.16.
//  Copyright © 2016 Alexandr Gaidukov. All rights reserved.
//

#import "SpringStrutsViewController.h"

@interface SpringStrutsViewController()

@property(nonatomic, weak) IBOutlet UIView *topLeftView;
@property(nonatomic, weak) IBOutlet UIView *topRightView;
@property(nonatomic, weak) IBOutlet UIView *bottomView;

@end

@implementation SpringStrutsViewController

- (void)viewWillLayoutSubviews {
//    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
//        
//        CGRect rect = self.topLeftView.frame;
//        rect.size.width = 254;
//        rect.size.height = 114;
//        self.topLeftView.frame = rect;
//        
//        rect = self.topRightView.frame;
//        rect.origin.x = 294;
//        rect.size.width = 254;
//        rect.size.height = 114;
//        self.topRightView.frame = rect;
//        
//        rect = self.bottomView.frame;
//        rect.origin.y = 154;
//        rect.size.width = 528;
//        rect.size.height = 114;
//        self.bottomView.frame = rect;
//        
//    } else {
//        
//        CGRect rect = self.topLeftView.frame;
//        rect.size.width = 130;
//        rect.size.height = 222;
//        self.topLeftView.frame = rect;
//        
//        rect = self.topRightView.frame;
//        rect.origin.x = 170;
//        rect.size.width = 130;
//        rect.size.height = 222;
//        self.topRightView.frame = rect;
//        
//        rect = self.bottomView.frame;
//        rect.origin.y = 262;
//        rect.size.width = 280;
//        rect.size.height = 222;
//        self.bottomView.frame = rect;
//    }
}

@end
