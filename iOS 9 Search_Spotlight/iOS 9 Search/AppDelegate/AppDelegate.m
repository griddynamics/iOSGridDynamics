//
//  AppDelegate.m
//  iOS 9 Search
//
//  Created by Egor Zubkov on 5/20/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "AppDelegate.h"
#import "DataGateway.h"
#import "CarsVC.h"
#import "MotosVC.h"
#import "SpotlightDataIndexator.h"

@import CoreSpotlight;

@interface AppDelegate ()

@property (nonatomic) id<CarsProviderProtocol, MotosProviderProtocol> dataProvider;
@property (nonatomic) SpotlightDataIndexator *spotlightDataIndexator;

@end

@implementation AppDelegate

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _dataProvider = [DataGateway new];
        
        [self setupSpotlightDataIndexator];
        [self setupUserActivity];
    }
    
    return self;
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    [self setupCarsVC];
    [self setupMotosVC];
    
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:60];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler {
    CarsVC *carsVC = [self carsVC];
    MotosVC *motosVC = [self motosVC];
    restorationHandler(@[carsVC, motosVC]); // or directly [carsVC restoreUserActivityState:userActivity];
    
    return YES;
}

#pragma mark - Private

- (void)setupCarsVC {
    CarsVC *carsVC = [self carsVC];
    carsVC.carsProvider = _dataProvider;
}

- (void)setupMotosVC {
    MotosVC *motosVC = [self motosVC];
    motosVC.motosProvider = _dataProvider;
}

- (void)setupSpotlightDataIndexator {
    _spotlightDataIndexator = [SpotlightDataIndexator new];
    [_spotlightDataIndexator indexCars:[_dataProvider cars]];
    [_spotlightDataIndexator indexMotos:[_dataProvider motos]];
}

- (CarsVC *)carsVC {
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *rootNavigationController = (UINavigationController *)tabBarController.viewControllers[0];
    return rootNavigationController.viewControllers.firstObject;
}

- (MotosVC *)motosVC {
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *rootNavigationController = (UINavigationController *)tabBarController.viewControllers[1];
    return rootNavigationController.viewControllers.firstObject;
}

- (void)setupUserActivity {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:[[NSBundle mainBundle] bundleIdentifier]];
    userActivity.title = @"Grid Dynamics";
    userActivity.keywords = [NSSet setWithObjects:@"Grid", @"Dynamics", nil];
    userActivity.eligibleForSearch = YES;
    
    CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"ItemContentType"];
    attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"logo"]);
    attributeSet.supportsNavigation = @1;
    attributeSet.latitude = @(37.331689);
    attributeSet.longitude = @(-122.030731);
    userActivity.contentAttributeSet = attributeSet;
    
    [self setUserActivity:userActivity];
    [userActivity becomeCurrent];
}

// should be implemented Background Fetch

@end
