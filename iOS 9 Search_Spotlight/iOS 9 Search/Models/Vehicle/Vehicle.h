//
//  Vehicle.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Vehicle : NSObject

@property (nonatomic, copy, readonly) NSString *model;
@property (nonatomic, copy, readonly) NSString *concern;
@property (nonatomic, copy, readonly) NSString *type;

@property (nonatomic, readonly) NSURL   *photoURL;
@property (nonatomic, readonly) UIImage *photo;

- (NSString *)title;

@end
