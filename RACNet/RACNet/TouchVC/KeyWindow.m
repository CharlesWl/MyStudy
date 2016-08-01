//
//  KeyWindow.m
//  RACNet
//
//  Created by charles on 16/7/26.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "KeyWindow.h"

@implementation KeyWindow

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
}

@end
