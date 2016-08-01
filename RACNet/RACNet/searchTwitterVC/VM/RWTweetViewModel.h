//
//  RWTweetViewModel.h
//  RACNet
//
//  Created by charles on 16/6/29.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTweet.h"
@interface RWTweetViewModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *sexString;
@property (nonatomic, copy) NSString *daojishiString;
@property (nonatomic, strong) RWTweet *rwtweet;
- (RWTweetViewModel *)getWithRwtweet;
/**
 *  计数减1(countdownTime - 1)
 */
- (void)countDown;

/**
 *  将当前的countdownTime信息转换成字符串
 */
- (NSString *)currentTimeString;

@end
