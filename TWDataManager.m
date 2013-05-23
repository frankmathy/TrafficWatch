//
//  TWDataManager.m
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import "TWDataManager.h"
#include "TWIncidentParser.h"

@implementation TWDataManager

+ (NSArray *) loadIncidentsFromDisc {
    // Load file from disc
    NSArray *pathComponents = [NSArray arrayWithObjects:NSHomeDirectory(),
                               @"Library",
                               @"Caches",
                               @"TW",
                               @"tw.xml",
                               nil];
    NSString *path = [NSString pathWithComponents:pathComponents];
    NSData *fileContent = [NSData dataWithContentsOfFile:path];
    
    // Parse
    TWIncidentParser *incidentParser = [[TWIncidentParser alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:fileContent];
    [parser setDelegate:incidentParser];
    [parser parse];
    
    return incidentParser.incidentArray;
}

@end
