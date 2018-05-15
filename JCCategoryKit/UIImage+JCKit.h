//
//  UIImage+JCKit.h
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JCKit)

/// UIColor生成UIImage
+ (UIImage *)jc_createImageWithColor:(UIColor *)color;

/// 更改图片颜色
- (UIImage *)jc_imageWithColor:(UIColor *)color;

/// 图片缩放
- (UIImage *)jc_scaleToSize:(CGSize)size;
- (UIImage *)jc_scaleToSize:(CGSize)size opaque:(BOOL)opaque;

/// 图片压缩并转化成NSData
- (NSData *)jc_compressWithLimitSize:(NSInteger)limitSize;

/// 图片加圆角
- (UIImage *)jc_imageWithCornerRadius:(CGFloat)cornerRadius;

@end
