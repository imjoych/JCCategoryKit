//
//  AppDelegate.m
//  JCCategoryKitDemo
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "JCCategoryKit.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)kitTest
{
    NSString *url = @"https://github.com/imjoych";
    NSDictionary *dict = @{@"action":@"home", @"type":@(2), @"desc":@"hhh"};
    NSString *requestUrl = [NSDictionary jc_appendWithUrl:url params:dict];
    NSLog(@"requestUrl = %@", requestUrl);
    url = [NSString stringWithFormat:@"%@#activity=justdoit", requestUrl];
    dict = @{@"how":@"follow me"};
    requestUrl = [NSDictionary jc_appendWithUrl:url params:dict];
    NSLog(@"requestUrl = %@", requestUrl);
    BOOL testBOOL = [@"ioschen@foxmail.com" jc_isEmailValid];
    testBOOL = [url jc_isUrlValid];
    testBOOL = [@"https://" jc_isUrlValid];
    testBOOL = [@"16212345678" jc_isPhoneNumber];
    testBOOL = [@"18212345678" jc_isPhoneNumber];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self kitTest];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
