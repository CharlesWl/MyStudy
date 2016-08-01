//
//  SubscribeViewModel.m
//  RACNet
//
//  Created by charles on 16/6/30.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "SubscribeViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "NSString+EmailAdditions.h"
#import <AFHTTPSessionManager.h>
#import "RequestHttpTool.h"

static NSString *const kSubscribeURL = @"http://reactivetest.apiary.io/subscribers";

@interface SubscribeViewModel ()
@property (nonatomic, strong) RACSignal *emailVaildSignal;
@end

@implementation SubscribeViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self mapSubscribeCommandStateToStatusMessage];
    }
    return self;
}

- (void)mapSubscribeCommandStateToStatusMessage {
    RACSignal *staredMessageSource = [self.subscribeCommand.executionSignals map:^id(id value) {
        return NSLocalizedString(@"发送请求中...", nil);
    }];
    
    RACSignal *completedMessageSource = [self.subscribeCommand.executionSignals flattenMap:^RACStream *(RACSignal *subscribeSignal) {
        return [[[subscribeSignal materialize] filter:^BOOL(RACEvent *event) {
            return event.eventType == RACEventTypeCompleted;
        }] map:^id(id value) {
            return NSLocalizedString(@"Thanks", nil);
        }];
    }];
    
    RACSignal *failedMessageSource = [[self.subscribeCommand.errors subscribeOn:[RACScheduler mainThreadScheduler]] map:^id(NSError *error) {
        return NSLocalizedString(@"Error :(", nil);
    }];
    
    RAC(self, statusMessage) = [RACSignal merge:@[staredMessageSource, completedMessageSource, failedMessageSource]];
    RAC(self, isSearch) = [self emailVaildSignal];
}

- (RACCommand *)subscribeCommand {
    if (!_subscribeCommand) {
        @weakify(self);
        _subscribeCommand = [[RACCommand alloc] initWithEnabled:self.emailVaildSignal signalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [SubscribeViewModel postEmail:self.email];
        }];
    }
    return _subscribeCommand;
}

- (RACSignal *)emailVaildSignal {
    if (!_emailVaildSignal) {
        _emailVaildSignal = [RACObserve(self, email) map:^id(NSString *email) {
            return @([email isValidEmail]);
        }];
    }
    return _emailVaildSignal;
}

+ (RACSignal *)postEmail:(NSString *)email {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [RequestHttpTool postWithURLString:@"http://www.weather.com.cn/data/cityinfo/101010100.html" parameters:nil success:^(id responseObjet) {
            [subscriber sendNext:responseObjet];
            [subscriber sendCompleted];
            NSLog(@"成功");
        } failure:^(NSError *error) {
            [subscriber sendError:error];
            NSLog(@"失败");
        }];
        return nil;
    }];
}

@end
