//
//  LYNetworkModel.h
//  LYKitDemo
//
//  Created by Mac on 2017/9/22.
//  Copyright © 2017年 c++Demo. All rights reserved.
//


/*
 *********************************************************************************
 
 
 网络请求的配置 如指定url显示菊花文字 隐藏菊花等
 
 *********************************************************************************
 */


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYNetworkModel : NSObject

/**
 菊花文字
 */
@property (nonatomic,copy)NSString *hudText;


/**
 指定接口
 */
@property (nonatomic,copy)NSString *url;


/**
 是否隐藏菊花 (默认no 跟随全局配置) 全局优先级最高
 */
@property (nonatomic,assign)BOOL isHiHud;


/**
 要显示菊花的view 不传默认当前屏幕上Vc的View
 */
@property (nonatomic,strong)UIView  *showView;

@end
