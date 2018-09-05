//
//  UIColor+LYColor.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LYColor)


/**
 * 使用16进制数字创建颜色
 */
+ (instancetype)ly_colorWithHex:(uint32_t)hex;

/**
 * 随机颜色
 */
+ (instancetype)ly_randomColor;

/**
 * RGB颜色
 */
+ (instancetype)ly_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

/**
 十六进制字符串显示颜色
 
 @param color 十六进制字符串
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)ly_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 *  @brief  渐变颜色
 *
 *  @param fromColor  开始颜色
 *  @param toColor    结束颜色
 *  @param height     渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)ly_gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;


@end
