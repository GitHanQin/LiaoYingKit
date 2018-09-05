//
//  UILabel+LYLable.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LYLable)


/**
 *  设置字间距
 */
- (void)ly_setColumnSpace:(CGFloat)columnSpace;

/**
 *  设置行距
 */
- (void)ly_setRowSpace:(CGFloat)rowSpace;

@end
