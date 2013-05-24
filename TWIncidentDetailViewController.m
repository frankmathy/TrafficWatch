//
//  TWIncidentDetailViewController.m
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import "TWIncidentDetailViewController.h"

@interface TWIncidentDetailViewController ()

@end

@implementation TWIncidentDetailViewController

@synthesize incident = _incident;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateIncident];
}

- (void) setIncident:(TWIncident *)newIncident {
    _incident = newIncident;
    [self updateIncident];
}

- (void) updateIncident {
    self.titleLabel.text = self.incident.incidentTitle;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
