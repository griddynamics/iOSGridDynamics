//
//  Vehicle.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "Vehicle.h"
#import "Vehicle_Protected.h"

@implementation Vehicle

#pragma mark - Initialization

- (instancetype)initWithModel:(NSString *)model
                      concern:(NSString *)concern
                         type:(NSString *)type
                     photoURL:(NSURL *)photoURL
                        photo:(UIImage *)photo {
    if (self = [super init]) {
        self.model = model;
        self.concern = concern;
        self.type = type;
        self.photoURL = photoURL;
        self.photo = photo;
    }
    
    return self;
}

#pragma mark - Public

- (NSString *)title {
    return [NSString stringWithFormat:@"%@ %@", self.concern, self.model];
}

@end
