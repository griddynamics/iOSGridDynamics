//
//  ALLabel.m
//  AutolayoutExample
//
//  Created by Alexandr Gaidukov on 14.06.16.
//  Copyright © 2016 Alexandr Gaidukov. All rights reserved.
//

#import "ALLabel.h"

@implementation ALLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    self.offsetSize = CGSizeZero;
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    return CGSizeMake(size.width + self.offsetSize.width, size.height + self.offsetSize.height);
}

@end
