//
//  BaseViewController.h
//  MWDispatchRouterDemo
//
//  Created by 石茗伟 on 2018/1/10.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    NSDictionary *_actionDict;          //action存储字典
}
@property (nonatomic, weak) id dataProtocol;                        //数据协议，用于其他页面跳转当前页面传参使用

/**
 跳转方法

 @param identifier 需要跳转页面的标识符
 */
- (void)toVCWithIdentifier:(NSString *)identifier
             fixParamsDict:(NSDictionary *)fixParamsDict;

@end
