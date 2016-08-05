//
//  searchTwitterVC.m
//  RACNet
//
//  Created by charles on 16/6/23.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "searchTwitterVC.h"
#import <ReactiveCocoa.h>
#import <RACEXTScope.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "RWTweetCell.h"
#import "RWTweet.h"
#import "RWTweetViewModel.h"
#import "SubscribeViewModel.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface searchTwitterVC () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *searchTextFiled;
@property (weak, nonatomic) IBOutlet UITableView *searchTV;
@property (nonatomic, strong) NSMutableArray *searchModels;
@property (weak, nonatomic) IBOutlet UIButton *searchBT;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) SubscribeViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *changeModelsArray;
@property (nonatomic, strong) RWTweet *tweet;

@end

@implementation searchTwitterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindWithViewModel];
    @weakify(self);
    RACSignal *signal = [self.searchTextFiled.rac_textSignal map:^id(NSString *text) {
        @strongify(self);
        return [self isValidSearchText:text] ? [UIColor whiteColor] :[UIColor lightGrayColor];
    }];
    RAC(self.searchTextFiled, backgroundColor) = signal;
    RAC(self.searchBT, backgroundColor) = [RACObserve(self.viewModel, isSearch) map:^id(NSNumber *value) {
        return value.integerValue == 1? [UIColor redColor] :[UIColor lightGrayColor];
    }];
    self.searchTV.delegate = self;
    self.searchTV.dataSource = self;
    [self.searchTV registerNib:[UINib nibWithNibName:@"RWTweetCell" bundle:nil] forCellReuseIdentifier:rwTweetCellIndentifier];
    self.searchTV.rowHeight = 100;
    //倒计时
    [self createTimer];
}

- (void)bindWithViewModel {
    self.viewModel = [[SubscribeViewModel alloc]init];
    RAC(self.viewModel, email) =self.searchTextFiled.rac_textSignal;
    self.searchBT.rac_command = self.viewModel.subscribeCommand;
    RAC(self.statusLabel, text) =RACObserve(self.viewModel, statusMessage);
}

- (void)createTimer {
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerEvent {
    for (int count=0; count<self.searchModels.count; count++) {
        RWTweetViewModel *rwtweetViewModel = self.searchModels[count];
        [rwtweetViewModel countDown];
        rwtweetViewModel.daojishiString = [rwtweetViewModel currentTimeString];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:count inSection:0];
        RWTweetCell *cell = [self.searchTV cellForRowAtIndexPath:indexPath];
        cell.rwtweetViewmodel = rwtweetViewModel;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RWTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:rwTweetCellIndentifier forIndexPath:indexPath];
    cell.rwtweetViewmodel = self.searchModels[indexPath.row];
    return cell;
}

/**
 *  逻辑判断
 */
- (BOOL)isValidSearchText:(NSString *)text {
    return text.length > 2;
}

- (NSMutableArray *)searchModels {
    if (!_searchModels) {
        _searchModels = [NSMutableArray array];
        for (int i = 0; i < 11; i++) {
            RWTweet *tweet = [[RWTweet alloc]init];
            tweet.username = [NSString stringWithFormat:@"王%d",i];
            tweet.status = i%2;
            tweet.profileImageUrl = @"GTI";
            tweet.allTime = arc4random()%2000;
            RWTweetViewModel *rwtweetViewModel = [[RWTweetViewModel alloc]init];
            rwtweetViewModel.rwtweet = tweet;
            [rwtweetViewModel getWithRwtweet];
            [_searchModels addObject:[rwtweetViewModel getWithRwtweet]];
        }
    }
    return _searchModels;
}

- (NSMutableArray *)changeModelsArray {
    if (!_changeModelsArray) {
        _changeModelsArray = [NSMutableArray array];
    }
    return _changeModelsArray;
}

@end
