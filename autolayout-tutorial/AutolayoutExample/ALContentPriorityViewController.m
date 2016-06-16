//
//  ALContentPriorityViewController.m
//  AutolayoutExample
//
//  Created by Alexandr Gaidukov on 13.06.16.
//  Copyright © 2016 Alexandr Gaidukov. All rights reserved.
//

#import "ALContentPriorityViewController.h"

@interface ALContentPriorityViewController ()

@property(nonatomic, weak) IBOutlet UILabel *topLabel;
@property(nonatomic, weak) IBOutlet UILabel *bottomLabel;

- (IBAction) huggingButtonTapped: (UIButton *)sender;
- (IBAction) compressionButtonTapped: (UIButton *)sender;

@end

@implementation ALContentPriorityViewController {
    NSString* _bigText;
    NSString* _shortText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _bigText = @"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.";
    
    _shortText = @"Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?";
}

- (IBAction) huggingButtonTapped: (UIButton *)sender {
    self.topLabel.text = _shortText;
    self.bottomLabel.text = _shortText;
}

- (IBAction) compressionButtonTapped: (UIButton *)sender {
    self.topLabel.text = _bigText;
    self.bottomLabel.text = _bigText;
}

@end
