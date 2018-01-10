//
//  MainViewController.m
//  MWDispatchRouterDemo
//
//  Created by 石茗伟 on 2018/1/10.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "MainViewController.h"
#import "ListVCPassParamsProtocol.h"
#import "DetailVCPassParamsProtocol.h"

@interface MainViewController () <ListVCPassParamsPtotocol, DetailVCPassParamsProtocol>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    __weak typeof(self) weakSelf = self;
    [self.dataProtocol mainVCPassParamsWithBlock:^(NSString *str1, NSString *str2, NSString *str3) {
        weakSelf.str1 = str1;
        weakSelf.str2 = str2;
        weakSelf.str3 = str3;
    }];
    NSLog(@"%@",self.str1);
    NSLog(@"%@",self.str2);
    NSLog(@"%@",self.str3);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.f, 0.f, 100.f, 100.f);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(toList) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.center = self.view.center;
}

- (void)toList {
    [self toVCWithIdentifier:@"list"];
}

- (void)toDetail {
    [self toVCWithIdentifier:@"detail"];
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

@end
