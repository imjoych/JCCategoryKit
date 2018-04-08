//
//  NSDictionary+JCKit.m
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Joych<https://github.com/imjoych>. All rights reserved.
//

#import "NSDictionary+JCKit.h"
#import "NSString+JCKit.h"

@implementation NSDictionary (JCKit)

- (NSString *)jc_appendURLKeysAndValuesString
{
    if (self.count < 1) {
        return @"";
    }
    NSMutableArray *arguments = [NSMutableArray arrayWithCapacity:self.count];
    for (NSString *key in self.allKeys) {
        [arguments addObject:[NSString stringWithFormat:@"%@=%@", [key jc_encodedString], [[self[key] description] jc_encodedString]]];
    }
    return [arguments componentsJoinedByString:@"&"];
}

- (NSString *)jc_appendWithOriginUrl:(NSString *)originUrl
{
    if (!originUrl || originUrl.length < 1 || self.count < 1) {
        return originUrl;
    }
    NSString *symbol = [originUrl containsString:@"?"] ? @"&":@"?";
    NSString *paramsString = [self jc_appendURLKeysAndValuesString];
    // 处理锚点
    NSString *anchorString = @"";
    NSRange anchorRange = [originUrl rangeOfString:@"#"];
    if (anchorRange.location != NSNotFound) {
        anchorString = [originUrl substringFromIndex:anchorRange.location];
        originUrl = [originUrl substringToIndex:anchorRange.location];
    }
    return [NSString stringWithFormat:@"%@%@%@%@", originUrl, symbol, paramsString, anchorString];
}

+ (NSDictionary *)jc_parseURLQuery:(NSString *)query
{
    if (![query jc_isValidString]) {
        return nil;
    }
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    for (NSString *pair in pairs) {
        NSArray *keyValue = [pair componentsSeparatedByString:@"="];
        if (keyValue.count == 2) {
            NSString *key = keyValue[0];
            NSString *value = [keyValue[1] jc_decodedString];
            parameters[key] = value;
        }
    }
    return parameters;
}

@end
