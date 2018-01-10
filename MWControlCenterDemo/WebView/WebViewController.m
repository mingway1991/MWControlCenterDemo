//
//  WebViewController.m
//  MWDispatchRouterDemo
//
//  Created by 石茗伟 on 2018/1/10.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "WebViewController.h"
@import WebKit;

@interface WebViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    NSString *url = [self.dataProtocol webViewFixUrl];
    if (!url) {
        url = [self.dataProtocol webViewUrl];
    }
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

@end
