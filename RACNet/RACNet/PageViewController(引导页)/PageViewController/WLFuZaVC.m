//
//  WLFuZaVC.m
//  RACNet
//
//  Created by charles on 16/8/5.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "WLFuZaVC.h"
#import "CutPageVC.h"
@interface WLFuZaVC ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,WLTableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *redHeadView;
@property (weak, nonatomic) IBOutlet UIView *bluePageView;
@property (weak, nonatomic) IBOutlet UIView *lightBlueSegumentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redTopViewConstraint;

@property (nonatomic, strong) NSArray *pageVCs;
@property (nonatomic, strong) NSArray *pageTitles;
@property (nonatomic, strong) UIPageViewController *pVc;
@end

@implementation WLFuZaVC

- (NSArray *)pageTitles {
    if (!_pageTitles) {
        _pageTitles = @[@"Music",@"Movie",@"Drama",@"音乐",@"电影",@"话剧"];
    }
    return _pageTitles;
}

- (NSArray *)pageVCs {
    if (!_pageVCs) {
        CutPageVC *redVc = [[CutPageVC alloc]init];
        redVc.delegate = self;
        redVc.pageString = self.pageTitles[0];
        redVc.view.backgroundColor = [UIColor redColor];
        
        CutPageVC *greenVc = [[CutPageVC alloc]init];
        greenVc.pageString = self.pageTitles[1];
        greenVc.delegate = self;
        greenVc.view.backgroundColor = [UIColor greenColor];
        
        CutPageVC *blueVc = [[CutPageVC alloc]init];
        blueVc.pageString = self.pageTitles[2];
        blueVc.delegate = self;
        blueVc.view.backgroundColor = [UIColor blueColor];
        
        CutPageVC *a = [[CutPageVC alloc]init];
        a.pageString = self.pageTitles[3];
        a.delegate = self;
        
        CutPageVC *b = [[CutPageVC alloc]init];
        b.pageString = self.pageTitles[4];
        b.delegate = self;
        
        CutPageVC *c = [[CutPageVC alloc]init];
        c.pageString = self.pageTitles[5];
        c.delegate = self;
        
        _pageVCs = @[redVc,greenVc,blueVc,a,b,c];
    }
    return _pageVCs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //scrollView的效果
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey :@(UIPageViewControllerSpineLocationNone)};
    //翻页效果
    //NSDictionary *options = @{UIPageViewControllerOptionSpineLocationKey : @(UIPageViewControllerSpineLocationMin)};
    
    self.pVc = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll/*UIPageViewControllerTransitionStylePageCurl*/ navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pVc.dataSource = self;
    self.pVc.delegate = self;
    //设置初始vc
    [self.pVc setViewControllers:@[self.pageVCs[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pVc.view.frame = self.bluePageView.bounds;
    [self addChildViewController:self.pVc];
    [self.bluePageView addSubview:self.pVc.view];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.pageVCs indexOfObject:viewController];
    if (index == 0) {
        //循环滑动
        //index = [self.pageVCs count] - 1;
        //不循环
        return nil;
    } else {
        index --;
    }
    return [self.pageVCs objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.pageVCs indexOfObject:viewController];
    index++;
    if (index == [self.pageVCs count]) {
        //循环滑动
        //index = 0;
        //不循环
        return nil;
    }
    return [self.pageVCs objectAtIndex:index];
}

- (void)myScrollView:(UIScrollView *)scrollView {
    NSLog(@"到底偏移量:%f",scrollView.contentOffset.y);
//     self.redHeadView.frame = CGRectMake(0, -scrollView.contentOffset.y, [UIScreen mainScreen].bounds.size.width, 300);
    if (scrollView.contentOffset.y > 300) {
        self.redTopViewConstraint.constant = -300;
    } else {
        self.redTopViewConstraint.constant = -scrollView.contentOffset.y;
    }
    
}

@end
