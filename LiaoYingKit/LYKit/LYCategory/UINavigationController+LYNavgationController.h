//
//  UINavigationController+LYNavgationController.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (LYNavgationController)

/** 寻找Navigation中的某个viewcontroler */
- (id)ly_findViewController:(Class)className;

/** 判断是否只有一个RootViewController */
- (BOOL)ly_isOnlyContainRootViewController;

/** RootViewController */
- (UIViewController *)ly_rootViewController;

/** 返回指定的viewcontroler */
- (NSArray *)ly_popToViewControllerWithClassName:(Class)className animated:(BOOL)animated;

/** pop回第n层 */
- (NSArray *)ly_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;

///以某种动画形式push
- (void)ly_pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;

///以某种动画形式pop
- (UIViewController *)ly_popViewControllerWithTransition:(UIViewAnimationTransition)transition;
@end
