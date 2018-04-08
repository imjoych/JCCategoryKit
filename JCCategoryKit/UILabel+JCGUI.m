//
//  UILabel+JCGUI.m
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/23.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import "UILabel+JCGUI.h"

#if !TARGET_OS_WATCH

@implementation UILabel (JCGUI)

- (void)jc_resetBlendedLayers
{
    [self jc_resetBlendedLayersWithColor:[UIColor whiteColor]];
}

- (void)jc_resetBlendedLayersWithColor:(UIColor *)color
{
    self.backgroundColor = color;
    self.clipsToBounds = YES;
    self.opaque = YES;
}

@end

#endif
