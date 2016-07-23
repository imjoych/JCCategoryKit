//
//  UILabel+JCGUI.m
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/23.
//  Copyright © 2016年 Boych<https://github.com/Boych>. All rights reserved.
//

#import "UILabel+JCGUI.h"

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
