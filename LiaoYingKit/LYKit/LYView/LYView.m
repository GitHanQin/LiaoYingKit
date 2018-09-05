//
//  LYView.m
//  LYKitDemo
//
//  Created by Mac on 2017/9/29.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import "LYView.h"
#import "LYKit.pch"

@interface LYView()

@property (nonatomic,strong)YLAwesomeSheetController *pikerVc; //选择器

@end

@implementation LYView



/**
 *  单利 配置用
 */
+ (instancetype)sharedLYView
{
    static LYView *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[LYView alloc]init];
        
        
    });
    
    return instance;
    
}


/**
 *  弹出底部转菊花
 *  @param loadingText  显示文字
 */
+ (void)showBottomLoading:(NSString *)loadingText{

    [[LYBottomLoading sharedLYBottomLoading] showLoading:loadingText];

}

/**
 *  关闭底部菊花
 */
+ (void)dissBottomLoading{


    [[LYBottomLoading sharedLYBottomLoading] dissLoading];    

}

/**
 *  弹出系统的laertVc
 *  @param alterTitle  弹出显示标题
 *  @param controller  当前控制器
 *  @param titieArray  弹出显示的文字
 *  @param preferredStyle  alert类型
 *  @param touchBlock  回调索引
 */

+ (void)showAlert:(NSString *)alterTitle  with_Controller:(UIViewController *)controller with_titleArr:(NSArray *)titieArray withShowType:(UIAlertControllerStyle)preferredStyle  with_Block:(alertTouchIndex)touchBlock{
    // 1.弹框提醒
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:alterTitle preferredStyle:preferredStyle];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    
    //遍历添加提示框文字
    for (int x=0; x<titieArray.count; x++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:titieArray[x] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //记录tag 点击调用的时候 返回给block
            
            
            if(touchBlock!=nil)
            {
                touchBlock(x);
            }
            
            
        }];
        
        [alert addAction:action];
        
        
        
    }
    
    // 弹出对话框
    [controller presentViewController:alert animated:true completion:nil];
    
}





/**
 *  弹出带输入框系统的laertVc
 *   @param alterTitle  弹出显示标题
 *  @param controller   当前控制器
 *  @param titieArray   弹出显示的文字
 *  @param placeholder  输入框占位文字
 *  @param block        回调索引和文字
 */

+ (UIAlertController *)showTextAlert:(NSString *)alterTitle withPlaceholder:(NSString *)placeholder  with_Controller:(UIViewController *)controller with_titleArr:(NSArray *)titieArray  with_Block:(LYViewAlertTextBlock)block{

    // 1.弹框提醒
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:alterTitle preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = placeholder;
        
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    
    
    
    //遍历添加提示框文字
    for (int x=0; x<titieArray.count; x++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:titieArray[x] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //记录tag 点击调用的时候 返回给block
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(block!=nil)
                {
                    UITextField *textFeild = alert.textFields[0];
                    
                    
                    block(textFeild.text,x);
                    
                    
                }
                
            });
            
        }];
        
        [alert addAction:action];
        
    }
    
    // 弹出对话框
    [controller presentViewController:alert animated:true completion:nil];
    
    return alert;



}


/**
 *   弹出选择器
 *   @param title        显示标题
 *   @param inVc         所在vc
 *   @param type         显示类型
 *   @param selectedData 选中的数据
 *   @param callBack     选中回调 YLAwesomeData 模型数据  [NSString stringWithFormat:@"%@",selectedData[0]];
 */
+ (void)showPikerViewWithTitle:(NSString *)title withInVc:(UIViewController *)inVc  WithType:(YLDataConfigType)type selectedData:(NSArray *)selectedData callBack:(YLAwesomeSheetSelectCallBack)callBack
{
    
  
    YLDataConfiguration *config = [[YLDataConfiguration alloc]initWithType:type selectedData:selectedData];
    YLAwesomeSheetController *pikerVc = [[YLAwesomeSheetController alloc]initWithTitle:title
                                                                              config:config
                                                                            callBack:callBack];
    [pikerVc showInController:inVc];
    
}


/**
 *   弹出时间选择器
 *   @param title        显示标题
 *   @param inVc         所在vc
 *   @param callBack     选中回调 
 */
+ (void)showTimePikerViewWithTitle:(NSString *)title withInVc:(UIViewController *)inVc callBack:(YLAwesomeSelectDateCallBack)callBack
{
    
    
   
    YLAwesomeSheetController *pikerVc = [[YLAwesomeSheetController alloc]initDatePickerWithTitle:title callBack:callBack];
    [pikerVc showInController:inVc];
    
}




/**
 轮播图

 @param urlArr 图片url数组
 @param superView 所在的父view
 @param masconBlock 约束
 @param seletdBblock 点击事件
 @return banner对象
 */
+ (XRCarouselView *)addBannerViewWithUrlArr:(NSArray *)urlArr withSuperView:(UIView *)superView  mas_makeConstraints:(void(^)(MASConstraintMaker *make))masconBlock  withDidImageClickBlock:(ClickBlock)seletdBblock
{
    
    XRCarouselView *bannerView = [[XRCarouselView alloc] initWithFrame:CGRectZero];
    
    [superView addSubview:bannerView];
    
    [bannerView mas_makeConstraints:masconBlock];
    
    bannerView.imageArray =  urlArr;
   
    bannerView.imageClickBlock = seletdBblock;
    
    return bannerView;
    
}

@end
