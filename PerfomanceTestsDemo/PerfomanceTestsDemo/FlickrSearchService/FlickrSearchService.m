//
//  FlickrSearchService.m
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 13/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import "FlickrSearchService.h"

NSString * const kFlickrApiKey = @"80d5afc09c82a6777c60ac3bc8005254";

@implementation FlickrSearchService

+ (void)imagesBySearchPhrase:(NSString *)searchPhrase succes:(void (^)(NSArray *))succesBlock failure:(void (^)(NSError *))failureBlock {
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[FlickrSearchService urlForSearchPhrase:searchPhrase] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSError *error;
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSArray *images = responseDict[@"photos"][@"photo"];
            NSMutableArray *parsedImages = [NSMutableArray new];
            for (NSDictionary *image in images) {
                FlickrImage *flickrImage = [[FlickrImage alloc] init];
                flickrImage.imageID = image[@"id"];
                flickrImage.secret = image[@"secret"];
                flickrImage.farm = [image[@"farm"] unsignedIntegerValue];
                flickrImage.server = image[@"server"];
                [parsedImages addObject:flickrImage];
            }
            succesBlock(parsedImages);
            
        }
        if (error) {
            failureBlock(error);
        }
    }] resume];
}

+ (NSURL *)urlForSearchPhrase:(NSString *)searchPhrase {
    NSString *url = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&text=%@&format=json&nojsoncallback=1", kFlickrApiKey, searchPhrase];
    return [NSURL URLWithString:url];
}

@end

@implementation FlickrImage

- (NSString *)url {
    if (_url == nil) {
        _url = [NSString stringWithFormat:@"http://farm%lu.staticflickr.com/%@/%@_%@_m.jpg", (unsigned long)self.farm, self.server, self.imageID, self.secret];
    }
    return _url;
}

@end
