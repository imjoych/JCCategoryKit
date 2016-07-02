//
//  NSArray+JCKit.h
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JCEnumerateBlock)(id obj, NSUInteger index);
typedef BOOL (^JCPassingTestBlock)(id obj);
typedef id (^HJAssociatedBlock)(id obj);

@interface NSArray (JCKit)

/** 枚举对象及索引。 */
- (void)jc_objWithIndex:(JCEnumerateBlock)block;

/** 获取符合条件的一组对象。 */
- (NSArray *)jc_selectObjs:(JCPassingTestBlock)block;

/** 获取与数组对象中相关联的一组数据。 */
- (NSArray *)jc_selectAssociatedObjs:(HJAssociatedBlock)block;

@end
