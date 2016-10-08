//
//  NSArray+JCKit.m
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
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
        return block(obj, idx);
    }]];
}

- (NSArray *)jc_selectAssociatedObjs:(JCAssociatedBlock)block
{
    NSParameterAssert(block);
    __block NSMutableArray *associatedObjs = [NSMutableArray arrayWithCapacity:self.count];
    [self jc_objWithIndex:^(id obj, NSUInteger idx) {
        [associatedObjs addObject:block(obj, idx)];
    }];
    return associatedObjs;
}

@end
