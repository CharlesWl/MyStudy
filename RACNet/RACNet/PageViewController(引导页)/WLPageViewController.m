//
//  WLPageViewController.m
//  RACNet
//
//  Created by charles on 16/7/29.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "WLPageViewController.h"

@interface WLPageViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *WLWebView;

@end

@implementation WLPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.WLWebView.delegate = self;
//    //http://c.m.163.com/nc/article/BT4OPGE600031H2L/full.html
//    //创建url
//    NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/BT4OPGE600031H2L/full.html"];
//    //请求
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    //请求任务
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        //解析数据
//        [self jsonWithData:data];
//    }];
//    [task resume];
}

- (void)jsonWithData:(NSData *)data {
    NSDictionary *allData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *nextData = [allData objectForKey:@"BT4OPGE600031H2L"];
    //body
    NSString *body = [nextData objectForKey:@"body"];
    //标题
    NSString *title = [nextData objectForKey:@"title"];
    //发布时间
    NSString *ptime = [nextData objectForKey:@"ptime"];
    //新闻来源
    NSString *source = [nextData objectForKey:@"source"];
    //取出图片对象
    NSArray *img = [nextData objectForKey:@"img"];
    for (int i = 0; i < img.count; i++) {
        //取出图片对象
        NSDictionary *imgDic = img[i];
        //取出占位符
        NSString *ref = [imgDic objectForKey:@"ref"];
        //图片路径
        NSString *src = [imgDic objectForKey:@"src"];
        //图片描述
        NSString *alt = [imgDic objectForKey:@"alt"];
        //替换图片占位符
        body = [body stringByReplacingOccurrencesOfString:ref withString:[NSString stringWithFormat:@"<div><img src=\"%@\"><div></div>%@</div>",src,alt]];
        //NSLog(@"图片对象:%@",imgDic);
    }
    //创建title标签
    NSString *titleHtml = [NSString stringWithFormat:@"<div id=\"mainTitle\"><b>%@</b></div>",title];
    //创建子标签
    NSString *subTitleHtml = [NSString stringWithFormat:@"<div id=\"subTitle\"><span class=\"time\">%@</span><span>%@</span></div>",ptime,source];
    
    //加载css的URL路径
    NSURL *css = [[NSBundle mainBundle] URLForResource:@"newsDetails" withExtension:@"css"];
    
    //创建css标签
    NSString *cssHtml = [NSString stringWithFormat:@"<link href=\"%@\" rel=\"stylesheet\">",css];
    
    //加载js的URL路径
    NSURL *js = [[NSBundle mainBundle] URLForResource:@"newsDetails" withExtension:@"js"];
    
    //创建js标签
    NSString *jsHtml = [NSString stringWithFormat:@"<script src=\"%@\"></script>",js];
    
    //拼接Html
    NSString *html = [NSString stringWithFormat:@"<html><head>%@</head><body>%@%@%@%@</body></html>",cssHtml,titleHtml,subTitleHtml,body,jsHtml];
    
    //NSLog(@"数据:%@",nextData);
    [self.WLWebView loadHTMLString:html baseURL:nil];
}

//打开相机
- (void)openCamera {
    UIImagePickerController *pickC = [[UIImagePickerController alloc]init];
    pickC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pickC animated:YES completion:nil];
}

//webViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //取出请求字符串
    NSString *requestString = request.URL.absoluteString;
    NSString *URLHeader = @"wl:///";
    NSRange range = [requestString rangeOfString:URLHeader];
    if (!range.location) {
        //包含协议头
        //取出要操作的方法名称
        NSString *method = [requestString substringFromIndex:range.length];
        SEL sel = NSSelectorFromString(method);
        [self performSelector:sel];
        NSLog(@"%@",method);
    }
    return YES;
}

@end
