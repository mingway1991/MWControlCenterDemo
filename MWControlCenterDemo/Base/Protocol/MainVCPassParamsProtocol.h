//
//  MainVCPassParamsProtocol.h
//  MWDispatchRouterDemo
//
//  Created by 石茗伟 on 2018/1/10.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#ifndef MainVCPassParamsProtocol_h
#define MainVCPassParamsProtocol_h

typedef void(^MainVCPassParamsBlock)(NSString *str1, NSString *str2, NSString *str3);

@protocol MainVCPassParamsProtocol <NSObject>

- (void)mainVCPassParamsWithBlock:(MainVCPassParamsBlock)block;

@end

#endif /* MainVCPassParamsProtocol_h */
