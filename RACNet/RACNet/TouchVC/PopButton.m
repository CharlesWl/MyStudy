//
//  PopButton.m
//  RACNet
//
//  Created by charles on 16/7/26.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "PopButton.h"

@implementation PopButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //判断这个点在不在self.imageButton上
    CGPoint imageButtonP = [self convertPoint:point toView:self.imageButton];
    if ([self.imageButton pointInside:imageButtonP withEvent:event] == YES) {
        return self.imageButton;
    } else {
        return [super hitTest:point withEvent:event];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    //当前触摸点
    CGPoint curP = [touch locationInView:self];
    //上一个触摸点
    CGPoint preP = [touch previousLocationInView:self];
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    if (CGRectContainsPoint(self.bounds, curP)) {
        self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    }
}

@end
