//
//  SpotlightDataIndexator.h
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/24/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpotlightCarsIndexableProtocol.h"
#import "SpotlightMotosIndexableProtocol.h"

@interface SpotlightDataIndexator : NSObject <SpotlightCarsIndexableProtocol, SpotlightMotosIndexableProtocol>

@end
