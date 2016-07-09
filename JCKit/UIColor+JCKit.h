//
//  UIColor+JCKit.h
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JCKit)

/// 十六进制字符串获取色值，如：ffffff
+ (UIColor *)jc_colorWithHexString:(NSString *)hexString;

/// 根据red、green、blue获取颜色值, 如：223.f, 160.f, 58.f
UIColor *jc_RGB(CGFloat red, CGFloat green, CGFloat blue);
/// 根据red、green、blue、alpha获取颜色值, 如：223.f, 160.f, 58.f, 1.f
UIColor *jc_RGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

@end
