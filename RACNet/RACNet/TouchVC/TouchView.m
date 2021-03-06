//
//  TouchView.m
//  RACNet
//
//  Created by charles on 16/7/25.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"你碰我！");
//}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"你摸我！");
    
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    //获取当前点的位置
    CGPoint curP = [touch locationInView:self];
    //获取上一个点的位置
    CGPoint preP = [touch previousLocationInView:self];
    // 获取它们x轴的偏移量,每次都是相对上一次
    CGFloat offsetX = curP.x - preP.x;
    // 获取y轴的偏移量
    CGFloat offsetY = curP.y - preP.y;
    // 修改控件的形变或者frame,center,就可以控制控件的位置
    // 形变也是相对上一次形变(平移)
    // CGAffineTransformMakeTranslation:会把之前形变给清空,重新开始设置形变参数
    // make:相对于最原始的位置形变
    // CGAffineTransform t:相对这个t的形变的基础上再去形变
    // 如果相对哪个形变再次形变,就传入它的形变
    if (CGRectContainsPoint(self.bounds,curP)) {
        self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    }
    
}

//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"你停止碰我！");
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"你取消了碰我的念头！");
//}

//
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    return ;
//}

@end
