//
//  WLPViewController.m
//  RACNet
//
//  Created by charles on 16/8/3.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "WLPViewController.h"

@interface WLPViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pVc;
@end

@implementation WLPViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //scrollView的效果
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey :@(UIPageViewControllerSpineLocationNone)};
    //翻页效果
    //NSDictionary *options = @{UIPageViewControllerOptionSpineLocationKey : @(UIPageViewControllerSpineLocationMin)};
    
    self.pVc = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll/*UIPageViewControllerTransitionStylePageCurl*/ navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pVc.dataSource = self;
    //设置初始vc
    [self.pVc setViewControllers:@[self.myViewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pVc.view.frame = self.view.bounds;
    [self addChildViewController:self.pVc];
    [self.view addSubview:self.pVc.view];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.myViewControllers indexOfObject:viewController];
    if (index == 0) {
        //循环滑动
        //index = [self.pageVCs count] - 1;
        //不循环
        return nil;
    } else {
        index --;
    }
    return [self.myViewControllers objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.myViewControllers indexOfObject:viewController];
    index++;
    if (index == [self.myViewControllers count]) {
        //循环滑动
        //index = 0;
        //不循环
        return nil;
    }
    return [self.myViewControllers objectAtIndex:index];
}

@end
