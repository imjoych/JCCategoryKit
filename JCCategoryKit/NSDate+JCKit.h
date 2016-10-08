//
//  NSDate+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JCKit)

/// 返回 yyyy-mm-dd hh:mm 格式的时间字符串
+ (NSString *)jc_currentDate;

/// 秒数转换为hh:mm:ss字符串时间格式
+ (NSString *)jc_timeStringWithSeconds:(int64_t)seconds;

@end

@interface NSDateFormatter (JCKit)

/// 缓存时间格式
+ (NSDateFormatter *)jc_cachedDateFormatter:(NSString *)stringDateFormatter;

@end
