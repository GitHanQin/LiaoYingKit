//
//  LYMedia.h
//  LYKitDemo
//
//  Created by Mac on 2017/9/27.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYKit.pch"
#import "TZImagePickerController.h"                     //图库处理
#import  "LYCode.h"                                     //二维码扫描
#import "TZVideoPlayerController.h"                     //图片选择
#import "TZPhotoPreviewController.h"                    //图片选择
#import <KSPhotoBrowser.h>                              //图片浏览
#import "PGG_BeautyViewController.h"                    //录音
#import "PGG_AudioUtillty.h"                            //播放录音
#import <WMPlayer.h>                                    //播放视频
#import <AVFoundation/AVFoundation.h>


@interface LYMedia : NSObject


#pragma mark——————————以下功能基于TZImagePickerController框架(注意返回值 使用时候最好判断一下返回类型)

/**如果是图片 就是图片数组  如果是视频等等 就是视频url */
typedef void (^LYMediiaBlock)(NSArray *dataArr);


/** 单例 某些对象方法可以使用 */
+ (instancetype)sharedLYMedia;


/** 弹出选择图片来源 */
+ (void)openImageWithMaxImgNumber:(int)maxNumber WithCuVc:(UIViewController *)cuVc withAllowsEditing:(BOOL)allowsEditing allowPickingVideo:(BOOL)allowPickingVideo  withOverBlock:(LYMediiaBlock)dataBlock;

/** 相机 */
- (void)openCameraWithCuVc:(UIViewController *)cuVc withAllowsEditing:(BOOL)allowsEditing withOverBlock:(LYMediiaBlock)dataBlock;
/** 相册 */
- (void)openAlbumWithMaxImgNumber:(int)maxNumber WithCuVc:(UIViewController *)cuVc withAllowsEditing:(BOOL)allowsEditing allowPickingVideo:(BOOL)allowPickingVideo  withOverBlock:(LYMediiaBlock)dataBlock;

/** 相机 */
- (void)openCameraWithCuVc:(UIViewController *)cuVc withAllowsEditing:(BOOL)allowsEditing withOverBlock:(LYMediiaBlock)dataBlock;

/** 录像 */
- (void)openVideotapeMaxTime:(int)maxTime WithCuVc:(UIViewController *)cuVc withOverBlock:(LYMediiaBlock)dataBlock;

/** 视频 */
- (void)openVideoWithCuVc:(UIViewController *)cuVc withOverBlock:(LYMediiaBlock)dataBlock;





/**
 *  打开二维码扫描器
 *  @param cuVc 当前控制器
 *  @param resultBlock 扫描完成的回调
 */
+ (void)OpenCodeVcWithCuVc:(UIViewController *)cuVc withResultBlock:(ScanCodeViewControllerBlock)resultBlock;




typedef void(^LYCodeAddBlock)(UIImage *codeImage);
/**
 *  生成二维码
 *  @param str   生成二维码的字符串
 *  @param image 显示的图标(如logo)
 *  @param block 生成的回调
 */
+ (void)AddCodeImageWithString:(NSString *)str  withImage:(UIImage *)image withAddBlock:(LYCodeAddBlock)block;






/**
 *  图片浏览器
 *  @param urlArr              url数组 (如果本地 就不传 直接传占位图数组)
 *  @param index               索引
 *  @param inView              一般是选中的UIImageView
 @return 图片浏览器对象
 */
+ (KSPhotoBrowser *)PhotoBrowser:(NSArray *)urlArr  withImgIndex:(NSInteger)index  withSuperView:(UIView *)inView;


/**
 录音
 
 @param fileBlock 录音完的回调
 */
+ (void)recording:(mp3FileNameBlock)fileBlock;



/**
 播放音频
 
 @param url 地址
 */

typedef void (^lyPlayOverBlock)(void);

+ (void)playRecord:(NSURL *)url wittBlock:(lyPlayOverBlock)playOverBlock;





/**
 是否在播放音频
 
 @return yes 和 no
 */
+ (BOOL)isPlayRecord;




/**
 获取本地视频时长
 
 @param path 视频路径
 @return 时长 秒
 */
+ (NSInteger )getVideoInfoWithSourcePath:(NSString *)path;





/**
 获取视频第一帧图片
 @param path 视频路径
 
 @return 图片
 */
+ (UIImage*)getVideoPreViewImage:(NSString *)videoPath;




/**
 播放视频(注意销毁视频播放器和引用)
 
 @param title 要展示的文字
 @param url 视频url 可以是本地和网络
 @param superView 父view
 @return 视频播放器对象
 */
+ (WMPlayer *)playerVideo_withTitle:(NSString *)title withUrl:(NSURL *)url withSuperView:(UIView *)superView;


@end
