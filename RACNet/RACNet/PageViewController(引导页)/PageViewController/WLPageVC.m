//
//  WLPageVC.m
//  RACNet
//
//  Created by charles on 16/8/3.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "WLPageVC.h"
#import "CutPageVC.h"
#import "WLPViewController.h"
@interface WLPageVC ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (nonatomic, strong) UIPageViewController *pVc;
@property (nonatomic, strong) NSArray *pageTitles;
@property (nonatomic, strong) NSArray *pageVCs;
@property (nonatomic, assign) NSInteger indexPage;
@property (nonatomic, strong) UIButton *selectedBT;
@property (weak, nonatomic) IBOutlet UIButton *musicBT;
@property (weak, nonatomic) IBOutlet UIButton *movieBT;
@property (weak, nonatomic) IBOutlet UIButton *dramaBT;

@end

@implementation WLPageVC
- (NSArray *)pageTitles {
    if (!_pageTitles) {
        _pageTitles = @[@"Music",@"Movie",@"Drama"];
    }
    return _pageTitles;
}

- (NSArray *)pageVCs {
    if (!_pageVCs) {
        CutPageVC *redVc = [[CutPageVC alloc]init];
        redVc.pageString = self.pageTitles[0];
        redVc.view.backgroundColor = [UIColor redColor];
        
        CutPageVC *greenVc = [[CutPageVC alloc]init];
        greenVc.pageString = self.pageTitles[1];
        greenVc.view.backgroundColor = [UIColor greenColor];
        
        CutPageVC *blueVc = [[CutPageVC alloc]init];
        blueVc.pageString = self.pageTitles[2];
        blueVc.view.backgroundColor = [UIColor blueColor];
        
        _pageVCs = @[redVc,greenVc,blueVc];
    }
    return _pageVCs;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.musicBT.selected = YES;
    self.selectedBT = self.musicBT;
    //scrollView的效果
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey :@(UIPageViewControllerSpineLocationNone)};
    //翻页效果
    //NSDictionary *options = @{UIPageViewControllerOptionSpineLocationKey : @(UIPageViewControllerSpineLocationMin)};

    self.pVc = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll/*UIPageViewControllerTransitionStylePageCurl*/ navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pVc.dataSource = self;
    self.pVc.delegate = self;
    //设置初始vc
    [self.pVc setViewControllers:@[self.pageVCs[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pVc.view.frame = self.pageView.bounds;
    [self addChildViewController:self.pVc];
    [self.pageView addSubview:self.pVc.view];
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

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    NSUInteger index = [self.pageVCs indexOfObject:pendingViewControllers[0]];
    self.selectedBT.selected = NO;
    switch (index) {
        case 0:
            self.musicBT.selected = YES;
            self.selectedBT = self.musicBT;
            break;
            
        case 1:
            self.movieBT.selected = YES;
            self.selectedBT = self.movieBT;
            break;
            
        case 2:
            self.dramaBT.selected = YES;
            self.selectedBT = self.dramaBT;
            break;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        NSLog(@"数组%@",previousViewControllers);
    }
    
    NSUInteger index = [self.pageVCs indexOfObject:previousViewControllers[0]];
    
}



- (IBAction)didClickOnChange:(UIButton *)sender {
    self.selectedBT.selected = NO;
    sender.selected = YES;
    if (sender.tag > self.selectedBT.tag) {
        [self.pVc setViewControllers:@[self.pageVCs[sender.tag]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    } else {
        [self.pVc setViewControllers:@[self.pageVCs[sender.tag]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
    self.selectedBT = sender;
    
}

@end
