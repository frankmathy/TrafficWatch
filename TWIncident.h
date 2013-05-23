//
//  Incident.h
//  TrafficWatch
//
//  Created by Felix Willnecker on 02.03.11.
//  Copyright 2011 Weptun GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define PRINT_DATE_FORMAT @"dd.MM.yyyy HH:mm:ss"

@interface TWIncident : NSObject <MKAnnotation>

+ (TWIncident *) incident;

@property (nonatomic, strong) NSDate *updated;
@property (nonatomic, strong) NSDate *expires;
@property (nonatomic, strong) NSString *incidentTitle;
@property (nonatomic, strong) NSString *anID;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSString *roadSignLink;
@property (nonatomic, strong) NSString *incidentTypeLink;
@property (nonatomic, strong) UIImage *roadsign;
@property (nonatomic, strong) UIImage *incidentType;
@property double latitude;
@property double longitude;
@property BOOL hasReloaded;

@property (nonatomic, strong, readonly) CLLocation *location;

#pragma mark - MKAnnodation Protocol
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// Title and subtitle for use by selection UI.
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

// Called as a result of dragging an annotation view.
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
