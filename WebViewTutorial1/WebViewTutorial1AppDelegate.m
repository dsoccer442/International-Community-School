//
//  WebViewTutorial1AppDelegate.m
//  WebViewTutorial1
//
//  Created by kent franks on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebViewTutorial1AppDelegate.h"
#import "FirstViewController.h"
#import <Parse/Parse.h>

@implementation WebViewTutorial1AppDelegate


@synthesize window = _window;

@synthesize tabBarController;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"hhZG0Nt99zg8gr0lAaN6JuyoPS1w1m8iFKDay3OK"
                  clientKey:@"S6iMNDqFNDBi11FwvIFxlL1CwmhUk4Cw9o7GDXNU"];
    
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    [window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
    //tabBarController.
    return YES;
        
    // Let the device know we want to receive push notifications
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
    (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    return YES;
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken
{
    [PFPush storeDeviceToken:newDeviceToken]; // Send parse the device token
    // Subscribe this user to the broadcast channel, ""
    [[PFInstallation currentInstallation] addUniqueObject:@"" forKey:@"channels"];
    [[PFInstallation currentInstallation] saveEventually];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [window release];
    [tabBarController release];
    [navigationController release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
