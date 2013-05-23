//
//  Incident.m
//  TrafficWatch
//
//  Created by Felix Willnecker on 02.03.11.
//  Copyright 2011 Weptun GmbH. All rights reserved.
//

#import "TWIncident.h"

static 	NSDateFormatter *formatter;

@implementation TWIncident

@synthesize updated;
@synthesize expires;
@synthesize incidentTitle;
@synthesize anID;
@synthesize link;
@synthesize summary;
@synthesize details;
@synthesize roadsign;
@synthesize incidentType;
@synthesize latitude;
@synthesize longitude;
@synthesize roadSignLink;
@synthesize incidentTypeLink;
@synthesize hasReloaded;

- (id) init {
    self = [super init];
    if(self) {
        if(formatter == nil) {
            formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:PRINT_DATE_FORMAT];
        }
        self.hasReloaded = NO;
    }
    return self;
}

+ (TWIncident *) incident {
	return [[TWIncident alloc] init];
}

- (NSString *) description {
	NSString *retValue = [NSString stringWithFormat:@"Incident\rID: %@\rTitle: %@\r Details: %@\r longitude: %f\r latitude: %f\r Updated: %@\r Expires: %@",
                          self.anID, self.incidentTitle, self.details, self.longitude, self.latitude, [formatter stringFromDate:self.updated],
						  [formatter stringFromDate:self.expires]];
	return retValue;
}

- (CLLocation *)location {
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
    return loc;
}

#pragma mark - MKAnnodation Protocol
- (CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (NSString *) title {
    return self.incidentTitle;
}

- (NSString *) subtitle {
    return self.summary;
}

- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    self.latitude = newCoordinate.latitude;
    self.longitude = newCoordinate.longitude;
}




@end
