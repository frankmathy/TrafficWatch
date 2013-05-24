//
//  TWIncidentTableViewController.h
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWIncidentDetailViewController.h"     

@interface TWIncidentTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *incidents;
@property (nonatomic, strong) TWIncidentDetailViewController *detailController;

@end
