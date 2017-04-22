//
//  UIButton+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JCKit)

/**
 * 按钮的文字与图片位置互换，前提是文字与图片已设置好
 * @param offset 位置偏移量，为0时图片和文字紧挨在一起
 */
- (void)jc_exchangeTitleAndImagePositionWithOffset:(CGFloat)offset;

/**
 *  设置按钮的文字颜色和图片，选中时文字和图片变浅50%
 *
 *  @param color 文字颜色
 *  @param image 按钮图片
 */
- (void)jc_setTitleColor:(UIColor *)color image:(UIImage *)image;

@end

@interface UIButton (JCHitTest)

@property (nonatomic, assign) UIEdgeInsets jc_hitTestEdgeInsets; ///< 扩展按钮点击区域

@end
