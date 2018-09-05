//
//  UITabBarController+LYUITabBarController.m
//  PersonalOC
//
//  Created by 韩琴 on 2018/8/16.
//  Copyright © 2018年 韩琴. All rights reserved.
//

#import "UITabBarController+LYUITabBarController.h"
#import "Define_UI.h"
@implementation UITabBarController (LYUITabBarController)
-(void)initWidthTitleArrary:(NSArray *)titleArrary imageArrary:(NSArray *)imageArrary contorllerArrary:(NSArray *)contorllers {
    for (int i = 0; i < titleArrary.count; i++) {
        [self addChildViewWithChildVcName:contorllers[i] title:titleArrary[i] imageName:imageArrary[i]];
    }
}
-(void)addChildViewWithChildVcName:(NSString *)childname title:(NSString *)title imageName:(NSString *)imageName {
    //1.根据字符串获取对应Class
    id childVcClass = NSClassFromString([NSString stringWithFormat:@"%@",childname]);
    if (childVcClass == nil) {
        return;
    }
    //2.将获取到的anyCalss转为对应类型
    UIViewController *childVc = [[((Class )childVcClass) alloc ] init];
    childVc.title = title;
    childVc.tabBarItem.image = LY_IMAGE_NAMED(imageName);
    UINavigationController *childNav = [[UINavigationController alloc] initWithRootViewController:childVc];
    if ([title isEqualToString:@""]) {
        childNav.tabBarItem.enabled = false;
    }
    [self addChildViewController:childNav];
}
@end
