//
//  NSObject+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JCKit)

/// 有效实例对象判断
- (BOOL)jc_isValidObject;

/** 实例对象的属性setter方法
 *  @param dictionary 属性 名称-值 键值对
 */
- (void)jc_setPropertiesValuesWithDictionary:(NSDictionary *)dictionary;

@end

@interface NSObject (JCHookMethod)

/// hook操作替换两个实例方法实现
- (void)swizzlingInClass:(Class)cls
        originalSelector:(SEL)originalSelector
        swizzledSelector:(SEL)swizzledSelector;

@end