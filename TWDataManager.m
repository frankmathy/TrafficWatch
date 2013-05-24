//
//  TWDataManager.m
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import "TWDataManager.h"
#import "TWIncidentParser.h"

@implementation TWDataManager

+ (NSArray *)parseIncidents:(NSData *)fileContent {
    // Parse incidents
    TWIncidentParser *incidentParser = [[TWIncidentParser alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:fileContent];
    [parser setDelegate:incidentParser];
    [parser parse];
    return incidentParser.incidentArray;
}

+ (NSArray *) loadIncidentsFromWeb {
    NSURL *url = [NSURL URLWithString:@"http://www.freiefahrt.info/lmst.de_DE.xml"];
    NSData *fileContent = [NSData dataWithContentsOfURL:url];
    
    return [self parseIncidents:fileContent];
}

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
    
    return [self parseIncidents:fileContent];
}

@end
