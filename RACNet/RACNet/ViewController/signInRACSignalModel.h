//
//  signInRACSignalModel.h
//  RACNet
//
//  Created by charles on 16/6/20.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^RWSignInResponse)(BOOL);


@interface signInRACSignalModel : NSObject

- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(RWSignInResponse)completeBlock;

@end
