//
//  LYBottomLoading.h
//  LYKitDemo
//
//  Created by Mac on 2017/9/29.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYBottomLoading : NSObject


/**
 *  单利 配置用
 */
+ (instancetype)sharedLYBottomLoading;


/**
 *  弹出转菊花
 *  @param loadingText  显示文字
 */
- (void)showLoading:(NSString *)loadingText;

/**
 *  关闭菊花
 */
- (void)dissLoading;

@end
