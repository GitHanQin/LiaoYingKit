//
//  MBProgressHUD+LYMBProgressHUD.h
//  PersonalOC
//
//  Created by 韩琴 on 2018/8/20.
//  Copyright © 2018年 韩琴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>
@interface MBProgressHUD(LYMBProgressHUD)
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
;
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end
