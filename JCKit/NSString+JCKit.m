//
//  NSString+JCKit.m
//  JCKit
//
//  Created by ChenJianjun on 16/7/1.
//  Copyright © 2016 Boych<https://github.com/Boych>. All rights reserved.
//

#import "NSString+JCKit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (JCKit)

- (BOOL)jc_isValidString
{
    if (!self
        || [self isEqualToString:@"(null)"]
        || [self jc_stringByTrimmingCharacters].length < 1) {
        return NO;
    }
    return YES;
}

- (NSString *)jc_stringByTrimmingCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end

@implementation NSString (JCStringEncoding)

- (NSString *)jc_encodeString
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)jc_decodeString
{
    return [self stringByRemovingPercentEncoding];
}

@end

@implementation NSString (JCStringChecking)

- (BOOL)jc_stringCheckingWithPattern:(NSString *)pattern
{
    if (![pattern jc_isValidString]
        || ![self jc_isValidString]) {
        return NO;
    }
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSTextCheckingResult *firstMacth = [regex firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    if (firstMacth) {
        return YES;
    }
    
    return NO;
}

/*
 * ^[1]，首字母必须是1
 * [3-8]，第二个数字为3-8之间
 * +，表示至少一个[3-8]
 * \\d，表示数字
 * {9}，表示后面包含9个数字
 * $，结束符
 */
- (BOOL)jc_isPhoneNumber
{
    if (![self jc_isValidString]) {
        return NO;
    }
    return [self jc_stringCheckingWithPattern:@"^[1][3-8]+\\d{9}$"];
}

- (BOOL)jc_isWebLink
{
    if (![self jc_isValidString]) {
        return NO;
    }
    return [self jc_stringCheckingWithPattern:@"^(http|https|ftp)://"];
}

- (BOOL)jc_isEmailValid
{
    //RFC 2822
    NSString *emailRegEx =
    @"(?:[A-Za-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[A-Za-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[A-Za-z0-9](?:[A-Za-"
    @"z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[A-Za-z0-9-]*[A-Za-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    BOOL match = [regExPredicate evaluateWithObject:self];
    return match;
}

@end

@implementation NSString (JCStringExchange)

- (NSString *)jc_md5
{
    const char *cString = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cString, (CC_LONG)strlen(cString), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSUInteger)jc_decimalNumberWithHexString
{
    NSString *hexString = self;
    if (!hexString || hexString.length == 0) {
        return 0;
    }
    
    NSUInteger length = [hexString length];
    NSUInteger nRet = 0;
    NSRange rangFindx = [hexString rangeOfString:@"0x"];
    NSRange rangFindX = [hexString rangeOfString:@"0X"];
    if (rangFindx.location == NSNotFound || rangFindX.location == NSNotFound) {
        length = length - 2;
        NSRange rang = NSMakeRange(2, length);
        hexString = [hexString substringWithRange:rang];
    }
    
    for(NSInteger i = 0; i < length; i++) {
        NSUInteger nDecNum;
        switch([hexString characterAtIndex:i])
        {
            case 'a':
            case 'A':
                nDecNum = 10;
                break;
            case 'b':
            case 'B':
                nDecNum = 11;
                break;
            case 'c':
            case 'C':
                nDecNum = 12;
                break;
            case 'd':
            case 'D':
                nDecNum = 13;
                break;
            case 'e':
            case 'E':
                nDecNum = 14;
                break;
            case 'f':
            case 'F':
                nDecNum = 15;
                break;
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                nDecNum = [hexString characterAtIndex:i] - '0';
                break;
            default:
                return 0;
        }
        nRet += nDecNum * pow(16, length - i - 1);
    }
    return nRet;
}

@end
