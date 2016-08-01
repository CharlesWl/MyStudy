//
//  AppDelegate.m
//  RACNet
//
//  Created by charles on 16/6/20.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectViewVC.h"
#import "searchTwitterVC.h"
#import "TouchVC.h"
#import "KeyWindow.h"
#import "WLPageViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[KeyWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    searchTwitterVC *viewVc = [[searchTwitterVC alloc]init];
    viewVc.tabBarItem.title = @"搜索";
    viewVc.tabBarItem.badgeValue = @"100";
    TouchVC *collectViewVc = [[TouchVC alloc]init];
    collectViewVc.tabBarItem.title = @"触摸";
    collectViewVc.tabBarItem.badgeValue = @"10";
    WLPageViewController *pageVc = [[WLPageViewController alloc]init];
    pageVc.tabBarItem.title = @"抓取";
    pageVc.tabBarItem.badgeValue = @"5";
    UITabBarController *tabbarController = [[UITabBarController alloc]init];
    tabbarController.viewControllers = @[viewVc,collectViewVc,pageVc];
    self.window.rootViewController = tabbarController;
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
