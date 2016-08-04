//
//  FlickrSearchService.h
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 13/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrSearchService : NSObject

+ (void)imagesBySearchPhrase:(NSString *)searchPhrase succes:(void (^)(NSArray *images))succesBlock failure:(void (^) (NSError *error))failureBlock;

@end

@interface FlickrImage : NSObject

@property (nonatomic) NSString *imageID;
@property (nonatomic) NSUInteger farm;
@property (nonatomic) NSString *secret;
@property (nonatomic) NSString *server;
@property (nonatomic) NSString *url;


@end
