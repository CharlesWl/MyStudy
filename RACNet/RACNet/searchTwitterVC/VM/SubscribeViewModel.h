//
//  SubscribeViewModel.h
//  RACNet
//
//  Created by charles on 16/6/30.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RACCommand.h>
@interface SubscribeViewModel : NSObject
@property (nonatomic, strong) RACCommand *subscribeCommand;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *statusMessage;
@property (nonatomic, assign) BOOL isSearch;
@end
