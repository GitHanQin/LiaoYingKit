//
//  UIButton+LYButton.m
//  GZYJ
//
//  Created by 了赢 on 2018/1/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "UIButton+LYButton.h"

@implementation UIButton (LYButton)
- (void)layoutButtonTitleImageEdgeInsetsWithStyle:(LSButtonEdgeInsetsStyle)style titleImgSpace:(CGFloat)space
{
    //获取label的宽和高
    CGFloat labelW = 0;
    CGFloat labelH = 0;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        labelW = self.titleLabel.intrinsicContentSize.width;
        labelH = self.titleLabel.intrinsicContentSize.height;
    }else{
        labelW = self.titleLabel.frame.size.width;
        labelH = self.titleLabel.frame.size.height;
    }
    //获取imageView的宽和高
    CGFloat imageW = self.imageView.frame.size.width;
    CGFloat imageH = self.imageView.frame.size.height;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    
    switch (style) {
        case LSButtonEdgeInsetsStyleLeft://文字在左 图片在右
            /*文字在左，图片在右计算方式  label的左边相对于button的左边来说是靠近，所以- ; label的右边相对于button的右边是远离，所以是+
             image的左边相对于button的左边来说是远离，所以为+ ; image的右边相对于button的右边来说是靠近，所以是 -
             
             */
            imageEdgeInsets = UIEdgeInsetsMake(0, labelW + space / 2, 0, -labelW - space / 2);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageW - space / 2, 0, imageW + space / 2);
            
            break;
            
        case LSButtonEdgeInsetsStyleRight://文字在右 图片在左
            imageEdgeInsets = UIEdgeInsetsMake(0, -space / 2, 0, space / 2);
            titleEdgeInsets = UIEdgeInsetsMake(0, space / 2, 0, -space / 2);
            break;
            
        case LSButtonEdgeInsetsStyleTop:// 文字在上 图片在下 上 左 下 右
            //            imageEdgeInsets = UIEdgeInsetsMake(labelH / 2 + space / 4, labelW / 2, -labelH / 2 - space / 4, -labelW / 2);
            //            titleEdgeInsets = UIEdgeInsetsMake(-imageH / 2 - space / 4, - imageW / 2, imageH / 2 + space / 4, imageW / 2);
            
            //            imageEdgeInsets = UIEdgeInsetsMake(labelH + space / 2, -labelW / 2, 0, -labelW);
            //            titleEdgeInsets = UIEdgeInsetsMake(-imageH -space / 2, -imageW / 2, 0, labelW);
            
            imageEdgeInsets = UIEdgeInsetsMake(0, -labelW / 2, -labelH - space / 2, -labelW);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageW / 2, imageH +space / 2, labelW);
            
            break;
            
        case LSButtonEdgeInsetsStyleBottom://文字在下 图片在上
            imageEdgeInsets = UIEdgeInsetsMake(-labelH / 2 - space / 4, labelW / 2, labelH / 2 + space / 4, - labelW / 2);
            titleEdgeInsets = UIEdgeInsetsMake(imageH / 2 + space / 4, -imageW / 2, - imageH / 2 - space / 4, imageW / 2);
            
            break;
            
        default:
            break;
    }
    
    self.titleEdgeInsets = titleEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
