//
//  RWTweetCell.h
//  RACNet
//
//  Created by charles on 16/6/23.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWTweetViewModel.h"
static NSString  *NSNotificationCountDownTimeCell = @"NSNotificationCountDownTimeCell";
#define rwTweetCellIndentifier @"rwTweetCellIndentifier"
@interface RWTweetCell : UITableViewCell
@property (nonatomic, strong) RWTweetViewModel *rwtweetViewmodel;
@end
