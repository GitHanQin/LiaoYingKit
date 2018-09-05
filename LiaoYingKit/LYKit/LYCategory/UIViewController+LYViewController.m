//
//  UIViewController+LYViewController.m
//  LYKitDemo
//
//  Created by 了赢 on 2018/7/12.
//  Copyright © 2018年 www.ly.LYKit. All rights reserved.
//

#import "UIViewController+LYViewController.h"

@implementation UIViewController (LYViewController)



/**
 设置导航栏颜色

 @param color 颜色
 */
- (void)ly_setNavBarBarTintColor:(UIColor *)color
{
    [self wr_setNavBarBarTintColor:color];
}



/**
 设置导航栏透明度

 @param alpha 透明度
 */
- (void)ly_setNavBarBackgroundAlpha:(CGFloat)alpha
{
  [self wr_setNavBarBackgroundAlpha:alpha];
}



/**
 设置导航栏两边按钮颜色

 @param color 颜色
 */
- (void)ly_setNavBarTintColor:(UIColor *)color
{
    [self wr_setNavBarTintColor:color];
}


/**
 设置导航栏上标题颜色

 @param color 颜色
 */
- (void)ly_setNavBarTitleColor:(UIColor *)color
{
    [self wr_setNavBarTitleColor:color];
}


 /**
   设置状态栏是 default 还是 lightContent

  @param style 类型
  */
 - (void)ly_setStatusBarStyle:(UIStatusBarStyle)style
 {
     [self wr_setStatusBarStyle:style];
 }


/**
 设置导航栏底部分割线是否隐藏

 @param hidden 是否隐藏
 */
- (void)ly_setNavBarShadowImageHidden:(BOOL)hidden
{
    [self wr_setNavBarShadowImageHidden:hidden];
}



@end
