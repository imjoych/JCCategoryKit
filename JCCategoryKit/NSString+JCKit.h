//
//  NSString+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JCKit)

/// 有效字符串判断
- (BOOL)jc_isValidString;

/// 去除字符串首尾空格和换行
- (NSString *)jc_stringByTrimmingCharacters;

@end

#pragma mark - encode & decode

@interface NSString (JCStringEncoding)

/// 字符串编码
- (NSString *)jc_encodeString;

/// 字符串解码
- (NSString *)jc_decodeString;

@end

#pragma mark - check string type

@interface NSString (JCStringChecking)

/// 正则表达式判断
- (BOOL)jc_stringCheckingWithPattern:(NSString *)pattern;

/// 是否为手机号
- (BOOL)jc_isPhoneNumber;

/// 是否为有效网址
- (BOOL)jc_isUrlValid;

/// 是否为有效邮箱
- (BOOL)jc_isEmailValid;

@end

#pragma mark - exchange

@interface NSString (JCStringExchange)

/// MD5加密
- (NSString *)jc_md5;

/// 16进制转10进制
- (NSUInteger)jc_decimalNumberWithHexString;

@end
