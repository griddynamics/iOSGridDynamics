//
//  ImageUtility.m
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 13/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import "ImageUtility.h"

@interface ImageUtility ()

@property (nonatomic) NSMutableDictionary *cache;

@end

@implementation ImageUtility

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance setCache:[[NSMutableDictionary alloc] init]];
    });
    return sharedInstance;
}

- (UIImage *)loadImageFromUrl:(NSString *)url {
    UIImage *image;
    NSData *data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0] returningResponse:nil error:nil];
    image = [UIImage imageWithData:data];
    image = [self imageWithBorder:image];
    return image;
}

- (void)loadImageFromUrl:(NSString *)url completion:(void (^)(UIImage *))completion {
    UIImage *image = [self.cache objectForKey:url];
    if (image == nil) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *dImage = [self loadImageFromUrl:url];
            [self.cache setObject:dImage forKey:url];
            completion(dImage);
        });
    }
    else {
        completion(image);
    }
}

- (UIImage *)imageWithBorder:(UIImage *)image {
    // UIImage *originalImage = <the image you want to add a line to>
    UIColor *lineColor = [UIColor whiteColor];
    
    UIGraphicsBeginImageContext(image.size);
    
    // Pass 1: Draw the original image as the background
    [image drawAtPoint:CGPointMake(0,0)];
    
    // Pass 2: Draw the line on top of original image
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, image.size.width, 0);
    CGContextSetStrokeColorWithColor(context, [lineColor CGColor]);
    CGContextStrokePath(context);
    
    // Create new image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Tidy up
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
