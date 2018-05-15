//
//  NSObject+JCKit.m
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import "NSObject+JCKit.h"
#import "NSString+JCKit.h"
#import <objc/runtime.h>

@implementation NSObject (JCKit)

- (BOOL)jc_isValidObject
{
    if (!self
        || NULL == self
        || [NSNull null] == self) {
        return NO;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        return [(NSString *)self jc_isValidString];
    }
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary *)self count] > 0;
    }
    
    if ([self isKindOfClass:[NSArray class]]) {
        return [(NSArray *)self count] > 0;
    }
    
    if ([self isKindOfClass:[NSData class]]) {
        return [(NSData *)self length] > 0;
    }
    
    if ([self isKindOfClass:[NSSet class]]) {
        return [(NSSet *)self count] > 0;
    }
    
    return YES;
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

+ (void)jc_hookWithOriginalSelector:(SEL)originalSelector replaceSelector:(SEL)replaceSelector
{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method replaceMethod = class_getInstanceMethod(class, replaceSelector);
    if (!originalMethod || !replaceMethod) {
        return;
    }
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(replaceMethod),
                                        method_getTypeEncoding(replaceMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            replaceSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, replaceMethod);
    }
}

@end

