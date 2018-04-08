//
//  UILabel+JCGUI.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/23.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import <UIKit/UIKit.h>

#if !TARGET_OS_WATCH

@interface UILabel (JCGUI)

/// 处理UILabel混合图层，默认背景为[UIColor whiteColor].
- (void)jc_resetBlendedLayers;

/// 处理UILabel混合图层，设置UILabel背景
- (void)jc_resetBlendedLayersWithColor:(UIColor *)color;

@end

#endif
