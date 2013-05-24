//
//  TWAppDelegate.h
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWIncidentTableViewController.h"
#include <CoreLocation/CoreLocation.h>

@interface TWAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TWIncidentTableViewController *tableController;

@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic) CLLocation *currentLocation;

@end
