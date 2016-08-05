//
//  CutPageVC.h
//  RACNet
//
//  Created by charles on 16/8/3.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WLTableViewDelegate <NSObject>

- (void)myScrollView:(UIScrollView *)scrollView;

@end


@interface CutPageVC : UIViewController

@property (nonatomic, copy) NSString *pageString;
@property (nonatomic, weak) id<WLTableViewDelegate>delegate;
@end
