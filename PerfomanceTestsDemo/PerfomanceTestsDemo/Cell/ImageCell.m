//
//  ImageCell.m
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 13/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell ()

@property (nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ImageCell

- (void)setupWithImage:(UIImage *)image {
    
    if (image) {
        self.imgView.accessibilityIdentifier = @"ImgView";
    }
    else {
        self.imgView.accessibilityIdentifier = nil;
    }
    self.imgView.image = image;
}

@end
