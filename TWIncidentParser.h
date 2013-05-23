//
//  IncidetParser.h
//  TrafficWatch
//
//  Created by Felix Willnecker on 02.03.11.
//  Copyright 2011 Weptun GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FEED_DATE_FORMAT @"yyyy-MM-dd'T'HH:mm:ss'Z'"

@class TWIncident;

@interface TWIncidentParser : NSObject <NSXMLParserDelegate> {

}

@property (strong, nonatomic) NSMutableString *contentOfCurrentTag;
@property (strong, nonatomic) TWIncident *currentIncident;
@property (strong, nonatomic) NSMutableArray *incidentArray;

@end
