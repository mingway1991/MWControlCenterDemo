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
    NSDictionary *_actionDict;
}
@property (nonatomic, weak) id dataProtocol;
@property (nonatomic, strong) NSDictionary *fixParamsDict;

- (void)toVCWithIdentifier:(NSString *)identifier;

@end
