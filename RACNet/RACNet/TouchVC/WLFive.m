//
//  WLFive.m
//  RACNet
//
//  Created by charles on 16/7/25.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "WLFive.h"

@implementation WLFive

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@",self.class);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"%s",__func__);
//    return [super hitTest:point withEvent:event];
//}

@end
