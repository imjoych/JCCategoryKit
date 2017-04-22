//
//  NSDictionary+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JCKit)

/// 拼接http请求接口传参
- (NSString *)jc_httpArgumentsString;

/// 解析网络请求返回的query
+ (NSDictionary *)jc_parseHttpURLQuery:(NSString *)query;

@end
