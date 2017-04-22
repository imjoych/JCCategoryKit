//
//  NSArray+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JCEnumerateBlock)(id obj, NSUInteger idx);
typedef BOOL (^JCPassingTestBlock)(id obj, NSUInteger idx);
typedef id (^JCAssociatedBlock)(id obj, NSUInteger idx);

@interface NSArray (JCKit)

/// 枚举对象及索引
- (void)jc_objWithIndex:(JCEnumerateBlock)block;

/// 获取符合条件的一组对象
- (NSArray *)jc_selectObjs:(JCPassingTestBlock)block;

/// 获取与数组对象中相关联的一组数据
- (NSArray *)jc_selectAssociatedObjs:(JCAssociatedBlock)block;

@end
