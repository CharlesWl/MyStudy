//
//  AppDelegate.m
//  RACNet
//
//  Created by charles on 16/6/20.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "AppDelegate.h"
#import "searchTwitterVC.h"
#import "TouchVC.h"
#import "KeyWindow.h"
#import "WLPageViewController.h"
#import "WLPageVC.h"
#import "MYPageVC.h"
#import "TouchView.h"
#import "WLFuZaVC.h"
@interface AppDelegate ()
@property (nonatomic, strong) UIWindow *secondWindow;
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
    WLPageVC *pVc = [[WLPageVC alloc]init];
    pVc.tabBarItem.title = @"切页";
    WLFuZaVC *myVc = [[WLFuZaVC alloc]init];
    myVc.tabBarItem.title = @"复杂";
    UITabBarController *tabbarController = [[UITabBarController alloc]init];
    tabbarController.viewControllers = @[viewVc,collectViewVc,pageVc,pVc,myVc];
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    
//    UIWindow *secondWindow = [[KeyWindow alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
//    secondWindow.windowLevel = UIWindowLevelStatusBar;
//    secondWindow.backgroundColor = [UIColor yellowColor];
//    UIViewController *noneVc = [[UIViewController alloc]init];
//    noneVc.view.frame = self.secondWindow.bounds;
//    secondWindow.rootViewController = noneVc;
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
//    button.backgroundColor = [UIColor blueColor];
//    [button addTarget:self action:@selector(didClickOnPush) forControlEvents:UIControlEventTouchUpInside];
//    [noneVc.view addSubview:button];
//    [secondWindow makeKeyAndVisible];
//    self.secondWindow = secondWindow;
    return YES;
}

- (void)didClickOnPush {
    MYPageVC *myVc = [[MYPageVC alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:myVc];
    self.window.rootViewController = navi;
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
