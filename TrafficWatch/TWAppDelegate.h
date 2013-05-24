//
//  TWAppDelegate.h
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWIncidentTableViewController.h"

@interface TWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TWIncidentTableViewController *tableController;

@end
