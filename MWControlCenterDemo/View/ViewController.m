//
//  ViewController.m
//  MWDispatchRouter
//
//  Created by 石茗伟 on 2018/1/10.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "ViewController.h"
#import "WebVCPassParamsProtocol.h"
#import "ListVCPassParamsProtocol.h"
#import "DetailVCPassParamsProtocol.h"
#import "MainVCPassParamsProtocol.h"

@interface ViewController () <WebVCPassParamsPtotocol, ListVCPassParamsPtotocol, DetailVCPassParamsProtocol, MainVCPassParamsProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.f, 0.f, 100.f, 100.f);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(toMain) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.center = self.view.center;
}

- (void)toMain {
    NSDictionary *fixParamsDict = @{@"str1":@"1",@"str2":@"2",@"str3":@"3"};
    [self toVCWithIdentifier:@"main" fixParamsDict:fixParamsDict];
}

- (void)toList {
    [self toVCWithIdentifier:@"list" fixParamsDict:@{}];
}

- (void)toDetail {
    [self toVCWithIdentifier:@"detail" fixParamsDict:@{}];
}

- (void)toWeb {
    [self toVCWithIdentifier:@"web" fixParamsDict:@{}];
}

#pragma mark -
#pragma mark WebVCPassParamsPtotocol
- (NSString *)webViewUrl {
    return @"http://www.baidu.com";
}

#pragma mark -
#pragma mark ListVCPassParamsPtotocol
- (NSString *)listStr {
    return @"test list";
}

#pragma mark -
#pragma mark DetailVCPassParamsProtocol
- (NSString *)detailStr {
    return @"test detail";
}

#pragma mark -
#pragma mark MainVCPassParamsProtocol
- (void)mainVCPassParamsWithBlock:(MainVCPassParamsBlock)block {
    block(@"1",@"2",@"3");
}

@end
