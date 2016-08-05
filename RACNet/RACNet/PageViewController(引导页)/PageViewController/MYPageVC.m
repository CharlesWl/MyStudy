//
//  MYPageVC.m
//  RACNet
//
//  Created by charles on 16/8/3.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "MYPageVC.h"
#import "WLPViewController.h"
#import "CutPageVC.h"
@interface MYPageVC ()
@property (nonatomic, strong) NSArray *pageVCs;
@property (nonatomic, strong) NSArray *pageTitles;
@property (nonatomic, strong) WLPViewController *pVc;
@end

@implementation MYPageVC

- (NSArray *)pageTitles {
    if (!_pageTitles) {
        _pageTitles = @[@"Music",@"Movie",@"Drama",@"音乐",@"电影",@"话剧"];
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
        
        CutPageVC *a = [[CutPageVC alloc]init];
        a.pageString = self.pageTitles[3];
        
        CutPageVC *b = [[CutPageVC alloc]init];
        b.pageString = self.pageTitles[4];
        
        CutPageVC *c = [[CutPageVC alloc]init];
        c.pageString = self.pageTitles[5];
        
        _pageVCs = @[redVc,greenVc,blueVc,a,b,c];
    }
    return _pageVCs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pVc = [[WLPViewController alloc]init];
    self.pVc.myViewControllers = self.pageVCs;
    self.pVc.view.frame = self.view.bounds;
    [self addChildViewController:self.pVc];
    [self.view addSubview:self.pVc.view];
}


@end
