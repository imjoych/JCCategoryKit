//
//  NSObject+JCKit.m
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import "NSObject+JCKit.h"
#import <objc/runtime.h>

@implementation NSObject (JCKit)

- (BOOL)jc_isValidString
{
    if ([self isKindOfClass:[NSString class]]) {
        return [(NSString *)self length] > 0;
    }
    return NO;
}

- (BOOL)jc_isValidData
{
    if ([self isKindOfClass:[NSData class]]) {
        return [(NSData *)self length] > 0;
    }
    return NO;
}

- (BOOL)jc_isValidArray
{
    if ([self isKindOfClass:[NSArray class]]) {
        return [(NSArray *)self count] > 0;
    }
    return NO;
}

- (BOOL)jc_isValidDictionary
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary *)self count] > 0;
    }
    return NO;
}

- (BOOL)jc_isValidSet
{
    if ([self isKindOfClass:[NSSet class]]) {
        return [(NSSet *)self count] > 0;
    }
    return NO;
}

- (void)jc_setPropertiesValuesWithDictionary:(NSDictionary *)dictionary
{
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key jc_isValidString]) {
            SEL action = [self stringToSelector:key];
            //属性赋值
            if ([self respondsToSelector:action] && obj) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self performSelector:action withObject:obj];
#pragma clang diagnostic pop
            }
        }
    }];
}

#pragma mark - Private

/// 根据字符串生成属性set方法
- (SEL)stringToSelector:(NSString *)modelKey
{
    NSString *first = [[modelKey substringToIndex:1] uppercaseString];
    NSString *end = [modelKey substringFromIndex:1];
    NSString *methodString = [NSString stringWithFormat:@"set%@%@:", first, end];
    return NSSelectorFromString(methodString);
}

@end

@implementation NSObject (JCHookMethod)

- (void)jc_swizzlingInClass:(Class)cls
           originalSelector:(SEL)originalSelector
           swizzledSelector:(SEL)swizzledSelector;
{
    Class class = cls;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

