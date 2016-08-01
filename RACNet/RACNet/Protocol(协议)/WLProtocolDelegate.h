//
//  WLProtocolDelegate.h
//  RACNet
//
//  Created by charles on 16/7/27.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WLProtocolDelegate <NSObject>

@required //必须实现的协议方法
- (void)oneMethod;

@optional //可以选择实现的方法
- (void)secondMethod;
- (void)thirdMethod;
- (void)forthMethod;
@end
