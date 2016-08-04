//
//  ImageUtility.h
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 13/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageUtility : NSObject

+ (instancetype)sharedInstance;

- (UIImage *)loadImageFromUrl:(NSString *)url;

- (void)loadImageFromUrl:(NSString *)url completion:(void (^) (UIImage *image))completion;

@end
