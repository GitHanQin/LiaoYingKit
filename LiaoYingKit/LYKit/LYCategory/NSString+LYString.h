//
//  NSString+LYString.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSString (LYString)

///  追加文档目录
- (NSString *)ly_appendDocumentPath;
///  追加缓存目录
- (NSString *)ly_appendCachePath;
///  追加临时目录
- (NSString *)ly_appendTempPath;


/**
 根据左边和右边的字符串,获得中间特定字符串
 @param strLeft 左边匹配字符串
 @param strRight 右边匹配的字符串
 */
- (NSString*)ly_substringWithinBoundsLeft:(NSString*)strLeft right:(NSString*)strRight;

/**
 阿拉伯数字转成中文
 
 @param arebic 阿拉伯数字
 @return 返回的中文数字
 */
+(NSString *)ly_translation:(NSString *)arebic;

/**
 字符串反转
 
 @param str 要反转的字符串
 @return 反转之后的字符串
 */
- (NSString*)ly_reverseWordsInString:(NSString*)str;

/**
 获得汉字的拼音
 
 @param chinese 汉字
 @return 拼音
 */
+ (NSString *)ly_transform:(NSString *)chinese;




/** 判断URL中是否包含中文 */
- (BOOL)ly_isContainChinese;


/** 获取字符数量 */
- (int)ly_wordsCount;



/** JSON字符串转成NSDictionary */
-(NSDictionary *)ly_dictionaryValue;


/**
 *  手机号码的有效性:分电信、联通、移动和小灵通
 */
- (BOOL)ly_isMobileNumberClassification;
/**
 *  手机号有效性
 */
- (BOOL)ly_isMobileNumber;

/**
 *  邮箱的有效性
 */
- (BOOL)ly_isEmailAddress;

/**
 *  简单的身份证有效性
 *
 */
- (BOOL)ly_simpleVerifyIdentityCardNum;

/**
 *  精确的身份证号码有效性检测
 *
 *  @param value 身份证号
 */
+ (BOOL)ly_accurateVerifyIDCardNumber:(NSString *)value;

/**
 *  车牌号的有效性
 */
- (BOOL)ly_isCarNumber;

/**
 *  银行卡的有效性
 */
- (BOOL)ly_bankCardluhmCheck;

/**
 *  IP地址有效性
 */
- (BOOL)ly_isIPAddress;

/**
 *  Mac地址有效性
 */
- (BOOL)ly_isMacAddress;

/**
 *  网址有效性
 */
- (BOOL)ly_isValidUrl;

/**
 *  纯汉字
 */
- (BOOL)ly_isValidChinese;

/**
 *  邮政编码
 */
- (BOOL)ly_isValidPostalcode;

/**
 *  工商税号
 */
- (BOOL)ly_isValidTaxNo;



/** 清除html标签 */
- (NSString *)ly_stringByStrippingHTML;

/** 清除js脚本 */
- (NSString *)ly_stringByRemovingScriptsAndStrippingHTML;

/** 去除空格 */
- (NSString *)ly_trimmingWhitespace;

/** 去除空格与空行 */
- (NSString *)ly_trimmingWhitespaceAndNewlines;



/** 加密 */
- (NSString *)ly_toMD5;
- (NSString *)ly_to16MD5;
- (NSString *)ly_sha1;
- (NSString *)ly_sha256;
- (NSString *)ly_sha512;

#pragma mark - Data convert to string or string to data.
/**
 *	string与Data转化
 */
- (NSData *)ly_toData;
+ (NSString *)ly_toStringWithData:(NSData *)data;



@end
