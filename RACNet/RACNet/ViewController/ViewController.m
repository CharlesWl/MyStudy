//
//  ViewController.m
//  RACNet
//
//  Created by charles on 16/6/20.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "signInRACSignalModel.h"
#import "RequestHttpTool.h"
#import "searchTwitterVC.h"
#import <RACEXTScope.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInBT;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, strong) signInRACSignalModel *signInRACSignalModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.signInRACSignalModel = [signInRACSignalModel new];
//    [self.userTextField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
    // 只有当输入超过3个字符时然后阅读信号操作
//    [[[self.userTextField.rac_textSignal map:^id(NSString *text) {
//        return @(text.length);
//    }]
    //过滤操作
//    filter:^BOOL(NSNumber *length) {
//        return length.integerValue > 3;
//    }]
//    subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
//    RACSignal *usernameSourceSignal =
//    self.usernameTextField.rac_textSignal;
//    
//    RACSignal *filteredUsername =[usernameSourceSignal
//                                  filter:^BOOL(id value){
//                                      NSString*text = value;
//                                      return text.length > 3;
//                                  }];
//    
//    [filteredUsername subscribeNext:^(id x){
//        NSLog(@"%@", x);
//    }];
    
    RACSignal *userSignal = [self.userTextField.rac_textSignal map:^id(NSString *text) {
        return @([self isValidUsername:text]);
    }];
    RACSignal *passwordSignal = [self.passwordTextField.rac_textSignal map:^id(NSString *text) {
        return @([self isValidPassword:text]);
    }];
    
    //map 转换操作
//    [[userSignal map:^id(NSNumber *number) {
//        return [number boolValue] ? [UIColor whiteColor] : [UIColor redColor];
//    }]
//    subscribeNext:^(UIColor *x) {
//        self.userTextField.backgroundColor = x;
//    }];
    //对象的属性绑定信号
    RAC(self.nameLabel, text) = [self.userTextField.rac_textSignal map:^(NSString *text) {
        return text;
    }];
    //kvo 监听
    [RACObserve(self, self.nameLabel.text) subscribeNext:^(NSString *text) {
        NSLog(@"变了变了:%@",text);
    }];
    RAC(self.userTextField, backgroundColor) = [userSignal map:^id(NSNumber *validUser) {
        return [validUser boolValue] ? [UIColor whiteColor] : [UIColor redColor];
    }];
    RAC(self.passwordTextField, backgroundColor) = [passwordSignal map:^id(NSNumber *validPassword) {
        return [validPassword boolValue] ? [UIColor whiteColor] : [UIColor redColor];
    }];
    @weakify(self);
    RACSignal *doubleSignal = [RACSignal combineLatest:@[userSignal, passwordSignal] reduce:^id(NSNumber *user, NSNumber *password){
        return [user boolValue]&&[password boolValue] ? [UIColor blueColor] :[UIColor lightGrayColor];
    }];
    [doubleSignal subscribeNext:^(UIColor *color) {
        [UIView animateWithDuration:.5 animations:^{
            @strongify(self);
            self.signInBT.backgroundColor = color;
        }];
    }];
    [[[[self.signInBT
      rac_signalForControlEvents:UIControlEventTouchUpInside]
       //附加操作
      doNext:^(id x) {
          self.signInBT.enabled = NO;
      }]
      //过滤信号中的信号
     flattenMap:^id(id value) {
         return [self signInSignal];
     }]
     subscribeNext:^(NSDictionary *signIn) {
         @strongify(self);
         self.signInBT.enabled = YES;
         searchTwitterVC *seachVc = [[searchTwitterVC alloc]init];
         UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:seachVc];
         [self presentViewController:navi animated:YES completion:nil];
         NSLog(@"Sign in Result : %@", signIn);
     }];
}

- (BOOL)isValidUsername:(NSString *)username {
    return [username isEqualToString:@"CharlesWl"];
}

- (BOOL)isValidPassword:(NSString *)password {
    return [password isEqualToString:@"1234567890"];
}

- (RACSignal *)signInSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [RequestHttpTool postWithURLString:@"http://www.weather.com.cn/data/cityinfo/101010100.html" parameters:nil success:^(id responseObjet) {
            [subscriber sendNext:responseObjet];
            [subscriber sendCompleted];
            NSLog(@"成功");
        } failure:^(NSError *error) {
            [subscriber sendError:error];
            NSLog(@"失败");
        }];
//        [self.signInRACSignalModel signInWithUsername:self.userTextField.text password:self.passwordTextField.text complete:^(BOOL success) {
//            [subscriber sendNext:@(success)];
//            [subscriber sendCompleted];
//        }];
        return nil;
    }];
}



@end
