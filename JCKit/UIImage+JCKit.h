//
//  UIImage+JCKit.h
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JCKit)

/**
 *  UIColor 转 UIImage
 *
 *  @param color
 *
 *  @return UIImage
 */
+ (UIImage *)jc_createImageWithColor:(UIColor *)color;

/**
 *  更改图片颜色
 *
 *  @param color 图片颜色
 *
 *  @return 处理好的图片
 */
- (UIImage *)jc_imageWithColor:(UIColor *)color;

/**
 * 图片缩放
 * @param opaque 不透明度, 默认为YES.
 */
- (UIImage *)jc_scaleToSize:(CGSize)size;
- (UIImage *)jc_scaleToSize:(CGSize)size opaque:(BOOL)opaque;

/**
 * 图片压缩并转化成NSData
 */
- (NSData *)jc_compressWithLimitSize:(NSInteger)limitSize;

/**
 * 图片加圆角
 */
- (UIImage *)jc_imageWithCornerRadius:(CGFloat)cornerRadius;

@end
