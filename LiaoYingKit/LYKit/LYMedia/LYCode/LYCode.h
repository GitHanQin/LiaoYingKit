//
//  LYCode.h
//  ScanCode
//
//  Created by Mac on 2017/10/10.
//  Copyright © 2017年 gaofu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScanCodeViewController.h" //二维码扫描控制器
#import "NSString+QRCode.h"        //二维码生成
#import <UIKit/UIKit.h>

@interface LYCode : NSObject


+ (void)OpenCodeVcWithCuVc:(UIViewController *)cuVc withResultBlock:(ScanCodeViewControllerBlock)resultBlock;


typedef void(^LYCodeAddBlock)(UIImage *codeImage);

+ (void)AddCodeImageWithString:(NSString *)str  withImage:(UIImage *)image withAddBlock:(LYCodeAddBlock)block;

@end
