//
//  NSDate+JCKit.h
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JCKit)

/** 返回 yyyy-MM-dd HH:mm 格式的时间字符串。 */
+ (NSString *)jc_currentDate;

@end

@interface NSDateFormatter (JCKit)

/** 缓存时间格式。 */
+ (NSDateFormatter *)jc_cachedDateFormatter:(NSString *)stringDateFormatter;

@end