//
//  TWDataManager.m
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import "TWDataManager.h"
#import "TWIncidentParser.h"
#import "TWIncident.h"

@implementation TWDataManager

+ (NSArray *)parseIncidents:(NSData *)fileContent {
    // Parse incidents
    TWIncidentParser *incidentParser = [[TWIncidentParser alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:fileContent];
    [parser setDelegate:incidentParser];
    [parser parse];
    
    NSArray *incidents = incidentParser.incidentArray;
    for(TWIncident *currentIncident in incidents) {
        // NSLog(@"%@", currentIncident.roadSignLink);
        
        // Calculate img folder + file name
        NSRange rangeOfIMGStr = [currentIncident.roadSignLink rangeOfString:@"img"];
        NSString *imgPath = [currentIncident.roadSignLink substringFromIndex:rangeOfIMGStr.location];
        
        // Build local path of image file
        NSArray *pathComponents = [NSArray arrayWithObjects:NSHomeDirectory(),
                                   @"Library",
                                   @"Caches",
                                   @"Images",
                                   imgPath,
                                   nil];
        
        NSString *path = [NSString pathWithComponents:pathComponents];
        
        // Create image from file content
        NSData *imgContent = [NSData dataWithContentsOfFile:path];
        UIImage *image = [[UIImage alloc] initWithData:imgContent];
        currentIncident.roadsign = image;
    }
    
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
    NSLog(@"Loading data from %@", path);
    NSData *fileContent = [NSData dataWithContentsOfFile:path];
    
    return [self parseIncidents:fileContent];
}

@end
