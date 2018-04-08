//
//  NSDictionary+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JCKit)

/// URL参数拼接
- (NSString *)jc_appendURLKeysAndValuesString;

/// URL拼接请求参数
+ (NSString *)jc_appendWithUrl:(NSString *)url params:(NSDictionary *)params;

/// 解析URL请求返回的query
+ (NSDictionary *)jc_parseURLQuery:(NSString *)query;

@end
