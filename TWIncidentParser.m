//
//  IncidetParser.m
//  TrafficWatch
//
//  Created by Felix Willnecker on 02.03.11.
//  Copyright 2011 Weptun GmbH. All rights reserved.
//

#import "TWIncidentParser.h"
#import "TWIncident.h"
#import "NSURL+QueryDictionary.h"

static 	NSDateFormatter *formatter;

@implementation TWIncidentParser

@synthesize contentOfCurrentTag;
@synthesize currentIncident;
@synthesize incidentArray;

- (id) init {
	self = [super init];
	if(self) {
		self.incidentArray = [NSMutableArray arrayWithCapacity:50];
        if(formatter == nil) {
            formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:FEED_DATE_FORMAT];
        }
	}
	return self;
}


- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
	attributes:(NSDictionary *)attributeDict {
	
	if(qName) {
		elementName = qName;
	}
	
	if([elementName isEqualToString:@"entry"]) {
		self.currentIncident = [TWIncident incident];
	}
	
	if(self.currentIncident) {
		self.contentOfCurrentTag = [NSMutableString stringWithCapacity:100];
		if([elementName isEqualToString:@"link"]) {
			self.currentIncident.link = [attributeDict objectForKey:@"href"];
			
			NSURL *anUrl = [NSURL URLWithString:self.currentIncident.link];			
			NSDictionary *params = [anUrl queryDictionary];
			
			NSString *longStr = [params objectForKey:@"lon"];
			if(longStr) {
				self.currentIncident.longitude = [longStr doubleValue];
			} else {
				self.currentIncident.longitude = 0.0f;
			}
			
			NSString *latStr = [params objectForKey:@"lat"];
			if(latStr) {
				self.currentIncident.latitude = [latStr doubleValue];
			} else {
				self.currentIncident.latitude = 0.0f;
			}			
		} else if([elementName isEqualToString:@"img"]) {
			NSString *imageLink = [attributeDict objectForKey:@"src"];
			if([attributeDict objectForKey:@"width"] != nil) {
				self.currentIncident.roadSignLink = imageLink;
			} else {
				self.currentIncident.incidentTypeLink = imageLink;
			}
		} 
	} else {
		self.contentOfCurrentTag = nil;
	}
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
	
	if(qName) {
		elementName = qName;
	}
	
	
	if([elementName isEqualToString:@"entry"]) {
		[self.incidentArray addObject:self.currentIncident];
		self.currentIncident = nil;
	}
	
	if(self.currentIncident) {
		if([elementName isEqualToString:@"title"]) {
			self.currentIncident.incidentTitle = self.contentOfCurrentTag;
		} else if([elementName isEqualToString:@"summary"]) {
			self.currentIncident.summary = self.contentOfCurrentTag;
		} else if([elementName isEqualToString:@"id"]) {
			self.currentIncident.anID = self.contentOfCurrentTag;
		} else if([elementName isEqualToString:@"updated"]) {
			self.currentIncident.updated = [formatter dateFromString:self.contentOfCurrentTag];
		} else if([elementName isEqualToString:@"expires"]) {
			self.currentIncident.expires = [formatter dateFromString:self.contentOfCurrentTag];
		} else if([elementName isEqualToString:@"content"]) {
            self.currentIncident.details = self.contentOfCurrentTag;
        }
	}
    
    if( ([elementName isEqualToString:@"div"] == false) && ([elementName isEqualToString:@"img"] == false) && ([elementName isEqualToString:@"br"] == false) ){
        self.contentOfCurrentTag = nil;
    }
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {	
	[self.contentOfCurrentTag appendString:string];
}

- (NSString *) description {
	return [NSString stringWithFormat:@"IncidendParserArray: %@",
            [self.incidentArray description]];
}


@end
