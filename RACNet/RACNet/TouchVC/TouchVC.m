//
//  TouchVC.m
//  RACNet
//
//  Created by charles on 16/7/25.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "TouchVC.h"
#import "TouchView.h"
#import "PopButton.h"

#import "WLProtocolDelegate.h"

@interface TouchVC ()<WLProtocolDelegate>

@end

@implementation TouchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    TouchView *tView = [[TouchView alloc]initWithFrame:CGRectMake(200, 500, 100, 100)];
    tView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tView];
}

- (IBAction)didClickOnAdd:(PopButton *)sender {
    UIButton *imageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 105, 105)];
    imageButton.center = CGPointMake(imageButton.bounds.size.width/2, -imageButton.bounds.size.height/2);
    imageButton.backgroundColor = [UIColor redColor];
    sender.imageButton = imageButton;
    [imageButton addTarget:self action:@selector(didClickOnDo) forControlEvents:UIControlEventTouchUpInside];
    [sender addSubview:imageButton];
}

- (void)didClickOnDo {
    NSLog(@"点击了红色区域");
}

#pragma mark - WLProtocolDelegate -
- (void)oneMethod {
    
}

@end
