//
//  Define_Device.h
//  LYKitDemo
//
//  Created by 了赢 on 2018/6/7.
//  Copyright © 2018年 www.ly.LYKit. All rights reserved.
//

#ifndef Define_Device_h
#define Define_Device_h


/** 主屏幕的高度 */
#define LY_M_SCREEN_H [[UIScreen mainScreen] bounds].size.height
/** 主屏幕的宽度 */
#define LY_M_SCREEN_W  [[UIScreen mainScreen] bounds].size.width

/** 主屏幕的高度比例 */
#define LY_M_SCREEN_H_SCALE (M_SCREEN_H/640)
/** 主屏幕的宽度比例 */
#define LY_M_SCREEN_W_SCALE (M_SCREEN_W/320)


/** 屏幕的分辨率 当结果为1时，显示的是普通屏幕，结果为2时，显示的是Retian屏幕 */
#define LY_M_SCREEN_SCALE [[UIScreen mainScreen] scale]

/** 除去信号区的屏幕的frame */
#define LY_APP_FRAME  [[UIScreen mainScreen] applicationFrame]
/** 应用程序的屏幕高度 */
#define LY_APP_FRAME_H   [[UIScreen mainScreen] applicationFrame].size.height
/** 应用程序的屏幕宽度 */
#define LY_APP_FRAME_W    [[UIScreen mainScreen] applicationFrame].size.width


/** 系统控件的默认高度 */
#define LY_D_STATUS_BAR_H   (20.f)
#define LY_D_TOP_BAR_H      (44.f)
#define LY_D_BOTTOM_BAR_H   (49.f)
#define LY_D_CELL_H (44.f)

/** 中英状态下键盘的高度 */
#define LY_ENG_KEY_BOARD_H  (216.f)
#define LY_CHN_KEY_BOARD_H  (252.f)


#define LY_IS_IOS6 (SYSTEM_VERSION >= 6.0 && SYSTEM_VERSION < 7)
#define LY_IS_IOS7 (SYSTEM_VERSION >= 7.0 && SYSTEM_VERSION < 8.0)
#define LY_IS_IOS8 (SYSTEM_VERSION >= 8.0 && SYSTEM_VERSION < 9.0)
#define LY_IS_IOS9 (SYSTEM_VERSION >= 9.0 && SYSTEM_VERSION < 10.0)

/** 设备判断 */
#define LY_IS_IPHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define LY_IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** iPhone的型号 */
#define LY_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define LY_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define LY_IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define LY_IS_IPHONEX ([[UIScreen mainScreen] bounds].size.height == 812)
#define LY_IS_IPHONE6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736)

/** 系统的版本号 */
#define LY_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

/** APP版本号 */
#define LY_APP_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** APP BUILD 版本号 */
#define LY_APP_BUILD_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/** APP名字 */
#define LY_APP_DISPLAY_NAME  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

/** 当前语言 */
#define LY_LOCAL_LANGUAGE [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]

/** 当前国家 */
#define LY_LOCAL_COUNTRY [[NSLocale currentLocale] objectForKey:NSLocaleCountrLYode]

 
/** 判断设备室真机还是模拟器 */
#if TARGET_OS_IPHONE
#endif

#if TARGET_IPHONE_SIMULATOR
#endif



#endif /* Define_Device_h */
