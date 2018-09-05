//
//  UITabBarController+LYUITabBarController.h
//  PersonalOC
//
//  Created by 韩琴 on 2018/8/16.
//  Copyright © 2018年 韩琴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (LYUITabBarController)
///初始化一个TtablebarViewcotroller通过数组
-(void)initWidthTitleArrary:(NSArray *)titleArrary imageArrary:(NSArray *)imageArrary contorllerArrary:(NSArray *)contorllers ;
@end

