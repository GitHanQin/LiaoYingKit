//
//  LYBottomLoading.m
//  LYKitDemo
//
//  Created by Mac on 2017/9/29.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import "LYBottomLoading.h"
#import <UIKit/UIKit.h>

@interface LYBottomLoading ()

//蒙版view
@property (nonatomic,strong)UIView *blackView;

//底部的view
@property (nonatomic,strong)UIView *bottomView;

//转动的菊花
@property (nonatomic,strong)UIActivityIndicatorView *activity;

//加载文字
@property (nonatomic,strong)UILabel *loadingLable;


@end


@implementation LYBottomLoading



/**
 *  单利 配置用
 */
+ (instancetype)sharedLYBottomLoading
{
    static LYBottomLoading *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[LYBottomLoading alloc]init];
 
        
    });
    
    return instance;
  
}


/**
 *  弹出转菊花
 *  @param loadingText  显示文字
 */
- (void)showLoading:(NSString *)loadingText
{

    self.blackView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.blackView.backgroundColor = [UIColor blackColor];
    
    self.blackView.alpha = 0;

    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 50)];
    
    self.bottomView.backgroundColor = [UIColor whiteColor];
    
 
    self.activity = [[UIActivityIndicatorView alloc] init];
    
    self.activity.frame = CGRectMake(20,self.bottomView.bounds.size.height/2-20/2 ,20 , 20);
    
    self.activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    [self.activity startAnimating];
    
    
    self.loadingLable = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, self.bottomView.bounds.size.width-50, self.bottomView.bounds.size.height)];
    
    self.loadingLable.text = loadingText;
 
  
    self.loadingLable.font = [UIFont systemFontOfSize:13];
    
    
    [self.bottomView addSubview:self.activity];
    
    [self.bottomView addSubview:self.loadingLable];
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.blackView];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.bottomView];
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
        self.blackView.alpha = 0.6;
        
        self.bottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, [UIScreen mainScreen].bounds.size.width, 50);
        
    }];
    


}


/**
 *  关闭菊花
 */
- (void)dissLoading{

    [self.activity stopAnimating];

    [UIView animateWithDuration:0.2 animations:^{
        
        
        self.blackView.alpha = 0;
        
        self.bottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 50);
        
    }completion:^(BOOL finished) {
        [self.blackView removeFromSuperview];
        
        [self.bottomView removeFromSuperview];
    }];

}

@end
