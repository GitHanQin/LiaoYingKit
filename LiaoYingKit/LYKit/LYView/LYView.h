//
//  LYView.h
//  LYKitDemo
//
//  Created by Mac on 2017/9/29.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YLAwesomeSheetController.h" //选择器依赖
#import "YLDataConfiguration.h"      //选择器依赖
#import "YLAwesomeData.h"          //选择器的数据
#import <XRCarouselView.h>        //轮播图
#import <Masonry.h>

@interface LYView : NSObject <XRCarouselViewDelegate>

/**
 *  弹出底部转菊花
 *  @param loadingText  显示文字
 */
+ (void)showBottomLoading:(NSString *)loadingText;

/**
 *  关闭底部菊花
 */
+ (void)dissBottomLoading;



typedef void (^alertTouchIndex)(int index);
/**
 *  弹出系统的laertVc
 *  @param alterTitle  弹出显示标题
 *  @param controller  当前控制器
 *  @param titieArray  弹出显示的文字
 *  @param preferredStyle  alert类型
 *  @param touchBlock  回调索引
 */
+ (void)showAlert:(NSString *)alterTitle  with_Controller:(UIViewController *)controller with_titleArr:(NSArray *)titieArray withShowType:(UIAlertControllerStyle)preferredStyle  with_Block:(alertTouchIndex)touchBlock;





typedef void (^LYViewAlertTextBlock)(NSString *text,int seletdIndex);
/**
 *  弹出带输入框系统的laertVc
 *   @param alterTitle  弹出显示标题
 *  @param controller   当前控制器
 *  @param titieArray   弹出显示的文字
 *  @param placeholder  输入框占位文字
 *  @param block        回调索引和文字
 */
+ (UIAlertController *)showTextAlert:(NSString *)alterTitle withPlaceholder:(NSString *)placeholder  with_Controller:(UIViewController *)controller with_titleArr:(NSArray *)titieArray  with_Block:(LYViewAlertTextBlock)block;


/**
 *   弹出选择器
 *   @param title        显示标题
 *   @param inVc         所在vc
 *   @param type         显示类型
 *   @param selectedData 选中的数据
 *   @param callBack     选中回调
 */
+ (void)showPikerViewWithTitle:(NSString *)title withInVc:(UIViewController *)inVc  WithType:(YLDataConfigType)type selectedData:(NSArray *)selectedData callBack:(YLAwesomeSheetSelectCallBack)callBack;

/**
 *   弹出时间选择器
 *   @param title        显示标题
 *   @param inVc         所在vc
 *   @param callBack     选中回调
 */
+ (void)showTimePikerViewWithTitle:(NSString *)title withInVc:(UIViewController *)inVc callBack:(YLAwesomeSelectDateCallBack)callBack;


 
/**
 轮播图
 
 @param urlArr 图片url数组
 @param superView 所在的父view
 @param masconBlock 约束
 @param seletdBblock 点击事件
 @return banner对象
 */
+ (XRCarouselView *)addBannerViewWithUrlArr:(NSArray *)urlArr withSuperView:(UIView *)superView  mas_makeConstraints:(void(^)(MASConstraintMaker *make))masconBlock  withDidImageClickBlock:(ClickBlock)seletdBblock;
@end
