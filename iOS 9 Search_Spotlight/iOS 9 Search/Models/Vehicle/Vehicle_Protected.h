//
//  Vehicle_Protected.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 6/1/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "Vehicle.h"

@interface Vehicle ()

- (instancetype)initWithModel:(NSString *)model
                      concern:(NSString *)concern
                         type:(NSString *)type
                     photoURL:(NSURL *)photoURL
                        photo:(UIImage *)photo;

@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSString *concern;
@property (nonatomic, copy) NSString *type;

@property (nonatomic) NSURL   *photoURL;
@property (nonatomic) UIImage *photo;

@end
