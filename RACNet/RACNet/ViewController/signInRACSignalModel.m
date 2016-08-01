//
//  signInRACSignalModel.m
//  RACNet
//
//  Created by charles on 16/6/20.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "signInRACSignalModel.h"

@implementation signInRACSignalModel
- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(RWSignInResponse)completeBlock {
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        BOOL success = [username isEqualToString:@"CharlesWl"] && [password isEqualToString:@"1234567890"];
        completeBlock(success);
    });
}
@end
