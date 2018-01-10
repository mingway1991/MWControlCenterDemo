//
//  BaseViewController.m
//  MWDispatchRouterDemo
//
//  Created by 石茗伟 on 2018/1/10.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () {
    NSString *_fixUrl;                      //修复模式下，跳转的url
    NSDictionary *_fixParamsDict;          //修复模式下，需要补充传递的参数
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPlist];
}

- (void)loadPlist {
    //先读取沙盒中的plist，找不到再读取bundle中的
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:NSStringFromClass([self class]) ofType:@".plist"];
    NSDictionary *dictContent = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    _actionDict = dictContent[@"Actions"];
}

- (void)toVCWithIdentifier:(NSString *)identifier
             fixParamsDict:(NSDictionary *)fixParamsDict {
    BOOL is_fix = [_actionDict[identifier][@"is_fix"] boolValue];
    Class vcName;
    if (is_fix) {
        _fixParamsDict = fixParamsDict;
        _fixUrl = _actionDict[identifier][@"url"];
        vcName = NSClassFromString(@"WebViewController");
    } else {
        vcName = NSClassFromString(_actionDict[identifier][@"vcName"]);
    }
    NSAssert(vcName, @"class name 不正确");
    BaseViewController *vc = [[vcName alloc] init];
    vc.dataProtocol = self;
    NSString *type = _actionDict[identifier][@"type"];
    if ([type isEqualToString:@"push"]) {
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([type isEqualToString:@"present"]) {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

#pragma mark -
#pragma mark WebVCPassParamsPtotocol
- (NSString *)webViewFixUrl {
    NSMutableString *appendUrl = [NSMutableString string];
    for (NSString *key in _fixParamsDict.allKeys) {
        [appendUrl appendString:[NSString stringWithFormat:@"&%@=%@",key,_fixParamsDict[key]]];
    }
    return [NSString stringWithFormat:@"%@%@",_fixUrl,appendUrl];
}


@end
