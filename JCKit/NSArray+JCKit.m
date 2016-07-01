//
//  NSArray+JCKit.m
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016年 Boych<https://github.com/Boych>. All rights reserved.
//

#import "NSArray+JCKit.h"

@implementation NSArray (JCKit)

- (void)jc_objWithIndex:(JCEnumerateBlock)block
{
    NSParameterAssert(block);
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block(obj, idx);
    }];
}

- (NSArray *)jc_selectObjs:(JCPassingTestBlock)block
{
    NSParameterAssert(block);
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }]];
}

- (NSArray *)jc_selectAssociatedObjs:(HJAssociatedBlock)block
{
    NSParameterAssert(block);
    NSMutableArray *associatedObjs = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        [associatedObjs addObject:block(obj)];
    }
    return associatedObjs;
}

@end
