//
//  ViewController.m
//  WebView_JS
//
//  Created by Mengjie.Wang on 2016/06/28.
//  Copyright © 2016年 王梦杰. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://wap.nuomi.com/?cid=002540"]];
    [self.webView loadRequest:request];
    
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    
    _webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        [_webView reload];
    }];
    
}

- (IBAction)back:(UIButton *)sender {
    if([_webView canGoBack]) {
        [_webView goBack];
    } else {
        NSLog(@"已经是首页");
    }
}

- (IBAction)next:(UIButton *)sender {
    if ([_webView canGoForward]) {
        [_webView goForward];
    } else {
        NSLog(@"已经是最后一页");
    }
}

- (IBAction)refresh:(UIButton *)sender {
    [_webView reload];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_webView.scrollView.mj_header endRefreshing];
}

@end
