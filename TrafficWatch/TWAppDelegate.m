//
//  TWAppDelegate.m
//  TrafficWatch
//
//  Created by Frank Mathy on 23.05.13.
//  Copyright (c) 2013 Frank Mathy. All rights reserved.
//

#import "TWAppDelegate.h"
#import "TWDataManager.h"
#import "TWIncidentTableViewController.h"

@implementation TWAppDelegate

// Download data and pass to table controller
- (void) downloadAndParse {
    NSArray *incidents = [TWDataManager loadIncidentsFromDisc];
    self.tableController.incidents = incidents;
    NSLog(@"Loaded %d incidents", [incidents count]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    self.tableController = [[TWIncidentTableViewController alloc] initWithNibName:@"TWIncidentTableViewController" bundle:nil];
    
    // Load incidents
    //tableViewController.incidents = [TWDataManager loadIncidentsFromDisc];
    // NSLog(@"Loaded %d incidents", [tableViewController.incidents count]);
    
    // Load incidents in background
    [self performSelectorInBackground:@selector(downloadAndParse) withObject:nil];
    
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.tableController];
    TWIncidentDetailViewController *detailViewController = [[TWIncidentDetailViewController alloc] initWithNibName:@"TWIncidentDetailViewController" bundle:nil];
    self.tableController.detailController = detailViewController;

    // For universal app
    UIDevice *currentDevice = [UIDevice currentDevice];
    if(currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        // iPhone Kram
        self.window.rootViewController = navController;
    } else {
        // iPad Implementierung
        UISplitViewController *splitController = [[UISplitViewController alloc] init];
        NSArray *controllerArray = [NSArray arrayWithObjects:navController, detailViewController, nil];
        splitController.viewControllers = controllerArray;
        self.window.rootViewController = splitController;
    }
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
