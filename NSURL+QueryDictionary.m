//
//  NSURL+QueryDictionary.m
//  TrafficWatch
//
//  Created by Felix Willnecker on 02.03.11.
//  Copyright 2011 Weptun GmbH. All rights reserved.
//

#import "NSURL+QueryDictionary.h"


@implementation NSURL (QueryDictionary) 

- (NSDictionary *) queryDictionary {
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	for (NSString* param in [[self query] componentsSeparatedByString:@"&"]) {
		NSArray* elts = [param componentsSeparatedByString:@"="];
		[params setObject:[elts objectAtIndex:1] forKey:[elts objectAtIndex:0]];
	}
	return params;
}

@end
