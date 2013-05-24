//
//  TWIncidentDetailViewController.h
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWIncident.h"

@interface TWIncidentDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) TWIncident *incident;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
