//
//  UIButton+LYButton.h
//  GZYJ
//
//  Created by 了赢 on 2018/1/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LYButton)
typedef NS_ENUM(NSUInteger, LSButtonEdgeInsetsStyle){
    //文字在左 图片在右
    LSButtonEdgeInsetsStyleLeft,
    //文字在右 图片在左
    LSButtonEdgeInsetsStyleRight,
    //文字在上 图片在下
    LSButtonEdgeInsetsStyleTop,
    //文字在下 图片在上
    LSButtonEdgeInsetsStyleBottom
};

//按钮方向
- (void)layoutButtonTitleImageEdgeInsetsWithStyle:(LSButtonEdgeInsetsStyle)style titleImgSpace:(CGFloat)space;
@end
