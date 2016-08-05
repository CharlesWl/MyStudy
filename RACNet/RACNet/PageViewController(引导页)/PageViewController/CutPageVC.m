//
//  CutPageVC.m
//  RACNet
//
//  Created by charles on 16/8/3.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "CutPageVC.h"

@interface CutPageVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *cutPageLabel;
@property (weak, nonatomic) IBOutlet UITableView *cutTV;
@end

@implementation CutPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cutPageLabel.text = self.pageString;
//    [self.cutTV setContentInset:UIEdgeInsetsMake(200, 0, 0, 0)];
    self.cutTV.delegate = self;
    self.cutTV.dataSource = self;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.delegate myScrollView:self.cutTV];
}


@end
