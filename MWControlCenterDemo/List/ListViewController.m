//
//  ListViewController.m
//  MWDispatchRouterDemo
//
//  Created by 石茗伟 on 2018/1/10.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "ListViewController.h"
#import "DetailVCPassParamsProtocol.h"

@interface ListViewController () <DetailVCPassParamsProtocol>

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    NSLog(@"%@",[self.dataProtocol listStr]);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.f, 0.f, 100.f, 100.f);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(toDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.center = self.view.center;
}

- (void)toDetail {
    [self toVCWithIdentifier:@"detail" fixParamsDict:@{}];
}

#pragma mark -
#pragma mark DetailVCPassParamsProtocol
- (NSString *)detailStr {
    return @"test detail";
}

@end
