//
//  RWTweetViewModel.m
//  RACNet
//
//  Created by charles on 16/6/29.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "RWTweetViewModel.h"

@implementation RWTweetViewModel
- (RWTweetViewModel *)getWithRwtweet {
    RWTweetViewModel *viewModel = [RWTweetViewModel new];
    viewModel.name = [NSString stringWithFormat:@"王八蛋%@",_rwtweet.username];
    viewModel.sexString = _rwtweet.status ? @"男" : @"女";
    viewModel.imageUrl = [NSString stringWithFormat:@"%@.jpg",_rwtweet.profileImageUrl];
    viewModel.daojishiString = [self currentTimeString];
    viewModel.rwtweet = _rwtweet;
    return viewModel;
}

- (void)countDown {
    _rwtweet.allTime = _rwtweet.allTime - 1;
}

- (NSString *)currentTimeString {
    NSInteger seconds = _rwtweet.allTime;
    
    if (seconds <= 0) {
        
        return @"倒计时结束";
        
    } else {
        
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)(seconds / 3600), (long)(seconds % 3600 / 60), (long)(seconds  % 60)];
    }
}

@end
