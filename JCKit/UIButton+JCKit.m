//
//  UIButton+JCKit.m
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import "UIButton+JCKit.h"
#import "UIImage+JCKit.h"
#import <objc/runtime.h>

@implementation UIButton (JCKit)

- (void)jc_exchangeTitleAndImagePositionWithOffset:(CGFloat)offset
{
    if (!self.imageView.image
        || !self.titleLabel.text) {
        return;
    }
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = self.titleLabel.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width - offset, 0, imageSize.width + offset);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + offset, 0, -titleSize.width - offset);
}

- (void)jc_setTitleColor:(UIColor *)color image:(UIImage *)image
{
    [self setTitleColor:color forState:UIControlStateNormal];
    UIColor *translucentColor = [color colorWithAlphaComponent:0.5f]; // 半透明色值
    [self setTitleColor:translucentColor forState:UIControlStateHighlighted];
    [self setTitleColor:translucentColor forState:UIControlStateDisabled];
    if (image) {
        [self setImage:image forState:UIControlStateNormal];
        UIImage *translucentImage = [image jc_imageWithColor:translucentColor];
        [self setImage:translucentImage forState:UIControlStateHighlighted];
        [self setImage:translucentImage forState:UIControlStateDisabled];
    }
}

@end

static NSString *const JCHitTestEdgeInsetsKey;

@implementation UIButton (JCHitTest)
@dynamic jc_hitTestEdgeInsets;

- (void)setJc_hitTestEdgeInsets:(UIEdgeInsets)jc_hitTestEdgeInsets
{
    NSValue *value = [NSValue value:&jc_hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &JCHitTestEdgeInsetsKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)jc_hitTestEdgeInsets
{
    NSValue *value = objc_getAssociatedObject(self, &JCHitTestEdgeInsetsKey);
    if (value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.enabled || self.hidden
        || UIEdgeInsetsEqualToEdgeInsets(self.jc_hitTestEdgeInsets, UIEdgeInsetsZero)) {
        return [super pointInside:point withEvent:event];
    }
    
    return CGRectContainsPoint(UIEdgeInsetsInsetRect(self.bounds, self.jc_hitTestEdgeInsets), point);
}

- (void)dealloc
{
    objc_removeAssociatedObjects(self);
}

@end
