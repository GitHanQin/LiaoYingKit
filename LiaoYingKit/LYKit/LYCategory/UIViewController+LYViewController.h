//
//  UIViewController+LYViewController.h
//  LYKitDemo
//
//  Created by 了赢 on 2018/7/12.
//  Copyright © 2018年 www.ly.LYKit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WRNavigationBar.h> //导航栏处理

@interface UIViewController (LYViewController)


// 设置导航栏颜色
- (void)ly_setNavBarBarTintColor:(UIColor *)color;

// 设置导航栏透明度
- (void)ly_setNavBarBackgroundAlpha:(CGFloat)alpha;

// 设置导航栏两边按钮颜色
- (void)ly_setNavBarTintColor:(UIColor *)color;

// 设置导航栏上标题颜色
- (void)ly_setNavBarTitleColor:(UIColor *)color;
// 设置状态栏是 default 还是 lightContent
- (void)ly_setStatusBarStyle:(UIStatusBarStyle)style;

// 设置导航栏底部分割线是否隐藏d
- (void)ly_setNavBarShadowImageHidden:(BOOL)hidden;

@end
