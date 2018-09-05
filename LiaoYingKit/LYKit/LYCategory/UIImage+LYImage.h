//
//  UIImage+LYImage.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);

@interface UIImage (LYImage)


//截屏
+(instancetype)ly_snapshotCurrentScreen;

//图片模糊效果
- (UIImage *)ly_blur;

//高效添加圆角图片
- (UIImage*)ly_imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

//圆形图片
+ (UIImage *)ly_GetRoundImagewithImage:(UIImage *)image;

//在图片上加居中的文字
- (UIImage *)ly_imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;

/**
 取图片某一像素点的颜色
 
 @param point 图片上的某一点
 @return 图片上这一点的颜色
 */
- (UIColor *)ly_colorAtPixel:(CGPoint)point;

/**
 生成一个纯色的图片
 
 @param color 图片颜色
 @return 返回的纯色图片
 */
- (UIImage *)ly_imageWithColor:(UIColor *)color;

/** 获得灰度图 */
- (UIImage *)ly_convertToGrayImage;


+ (UIImage *)ly_animatedImageWithAnimatedGIFData:(NSData *)theData;
+ (UIImage *)ly_animatedImageWithAnimatedGIFURL:(NSURL *)theURL;


/** 合并两个图片为一个图片 */
+ (UIImage*)ly_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

/** 压缩图片 最大字节大小为maxLength */
- (NSData *)ly_compressWithMaxLength:(NSInteger)maxLength;

/** 纠正图片的方向 */
- (UIImage *)ly_fixOrientation;

/** 按给定的方向旋转图片 */
- (UIImage*)ly_rotate:(UIImageOrientation)orient;

/** 垂直翻转 */
- (UIImage *)ly_flipVertical;

/** 水平翻转 */
- (UIImage *)ly_flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)ly_imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)ly_imageRotatedByRadians:(CGFloat)radians;


/** 截取当前image对象rect区域内的图像 */
- (UIImage *)ly_subImageWithRect:(CGRect)rect;

/** 压缩图片至指定尺寸 */
- (UIImage *)ly_rescaleImageToSize:(CGSize)size;

/** 压缩图片至指定像素 */
- (UIImage *)ly_rescaleImageToPX:(CGFloat )toPX;

/** 在指定的size里面生成一个平铺的图片 */
- (UIImage *)ly_getTiledImageWithSize:(CGSize)size;

/** UIView转化为UIImage */
+ (UIImage *)ly_imageFromView:(UIView *)view;

- (UIImage *)ly_imageCroppedToRect:(CGRect)rect;
- (UIImage *)ly_imageScaledToSize:(CGSize)size;
- (UIImage *)ly_imageScaledToFitSize:(CGSize)size;
- (UIImage *)ly_imageScaledToFillSize:(CGSize)size;
- (UIImage *)ly_imageCroppedAndScaledToSize:(CGSize)size
                             contentMode:(UIViewContentMode)contentMode
                                padToFit:(BOOL)padToFit;

- (UIImage *)ly_reflectedImageWithScale:(CGFloat)scale;
- (UIImage *)ly_imageWithReflectionWithScale:(CGFloat)scale gap:(CGFloat)gap alpha:(CGFloat)alpha;

//带有阴影效果的图片
- (UIImage *)ly_imageWithShadowColor:(UIColor *)color offset:(CGSize)offset blur:(CGFloat)blur;
- (UIImage *)ly_imageWithCornerRadius:(CGFloat)radius;
- (UIImage *)ly_imageWithAlpha:(CGFloat)alpha;
- (UIImage *)ly_imageWithMask:(UIImage *)maskImage;

- (UIImage *)ly_maskImageFromImageAlpha;


@end
