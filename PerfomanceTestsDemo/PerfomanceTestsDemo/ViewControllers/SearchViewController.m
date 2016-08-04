//
//  ViewController.m
//  PerfomanceTestsDemo
//
//  Created by Diana Evlakhova on 08/07/16.
//  Copyright © 2016 Grid Dynamics. All rights reserved.
//

#import "SearchViewController.h"
#import "FlickrSearchService.h"
#import "ImageCell.h"
#import "ImageUtility.h"

@interface SearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic) NSArray *images;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.accessibilityIdentifier = @"searchBar";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageCell class]) bundle:nil] forCellWithReuseIdentifier:@"ImageCell"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    [cell setupWithImage:nil];
    
    FlickrImage *flickrImg = self.images[indexPath.row];

//    UIImage *image = [[ImageUtility sharedInstance] loadImageFromUrl:[flickrImg url]];
//    [cell setupWithImage:image];
    
    [[ImageUtility sharedInstance] loadImageFromUrl:[flickrImg url] completion:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell setupWithImage:image];
        });
    }];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [FlickrSearchService imagesBySearchPhrase:searchBar.text succes:^(NSArray *images) {
        self.images = images;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
