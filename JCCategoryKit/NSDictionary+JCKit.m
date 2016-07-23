//
//  NSDictionary+JCKit.m
//  JCCategoryKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import "NSDictionary+JCKit.h"
#import "NSString+JCKit.h"

@implementation NSDictionary (JCKit)

- (NSString *)jc_httpArgumentsString
{
    NSMutableArray *arguments = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSString *key in self.allKeys) {
        [arguments addObject:[NSString stringWithFormat:@"%@=%@", [key jc_encodeString], [[[self objectForKey:key] description] jc_encodeString]]];
    }
    return [arguments componentsJoinedByString:@"&"];
}

+ (NSDictionary *)jc_parseHttpURLQuery:(NSString *)query
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
            NSString *value = [keyValue[1] jc_decodeString];
            [parameters setObject:value forKey:key];
        }
    }
    return parameters;
}

@end
