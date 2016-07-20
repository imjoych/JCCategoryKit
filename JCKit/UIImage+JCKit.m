//
//  UIImage+JCKit.m
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import "UIImage+JCKit.h"

@implementation UIImage (JCKit)

+ (UIImage *)jc_createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1.f, 1.f);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)jc_imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)jc_scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (NSData *)jc_compressWithLimitSize:(NSInteger)limitSize
{
    CGFloat compression = 1.f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(self, compression);
    while ([imageData length] > limitSize && compression > maxCompression) {
        @autoreleasepool {
            UIImage *image = nil;
            if (compression == 1.f) {
                image = self;
                compression -= 0.8;
            } else {
                image = [UIImage imageWithData:imageData];
                image = [image jc_scaleToSize:CGSizeMake(image.size.width/2, image.size.height/2)];
            }
            imageData = UIImageJPEGRepresentation(image, compression);
        }
    }
    return imageData;
}

- (UIImage *)jc_imageWithCornerRadius:(CGFloat)cornerRadius
{
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    if (cornerRadius < 0) {
        cornerRadius = 0;
    } else if (cornerRadius > MIN(width, height)) {
        cornerRadius = MIN(width, height) / 2.f;
    }
    
    CGRect imageFrame = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:cornerRadius] addClip];
    [self drawInRect:imageFrame];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
