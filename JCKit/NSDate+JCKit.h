//
//  NSDate+JCKit.h
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JCKit)

+ (NSString *)jc_currentDate;

@end

@interface NSDateFormatter (JCKit)

+ (NSDateFormatter *)jc_cachedDateFormatter:(NSString *)stringDateFormatter;

@end