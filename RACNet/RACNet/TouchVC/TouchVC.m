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

@interface TouchVC ()<WLProtocolDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTV;
@property (weak, nonatomic) IBOutlet UIView *headView;
@end

@implementation TouchVC

- (IBAction)didClickOnDianji:(UIButton *)sender {
    NSLog(@"点击");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //TouchView *tView = [[TouchView alloc]initWithFrame:CGRectMake(200, 500, 100, 100)];
    //tView.backgroundColor = [UIColor redColor];
    //[self.view addSubview:tView];
    UIView *table1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    table1.backgroundColor = [UIColor redColor];
    //[self.view addSubview:table1];
    [self.myTV setContentInset:UIEdgeInsetsMake(200, 0, 0, 0)];
    self.myTV.delegate = self;
    self.myTV.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"对不对";
    
    return cell;
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


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"偏移量%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < -200) {
        self.headView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    } else {
        if (scrollView.contentOffset.y > -40) {
            self.headView.frame = CGRectMake(0, - 160, [UIScreen mainScreen].bounds.size.width, 200);
        } else {
            self.headView.frame = CGRectMake(0, -(scrollView.contentOffset.y+200), [UIScreen mainScreen].bounds.size.width, 200);
        }
        
    }
    
}

@end
