//
//  LYCode.m
//  ScanCode
//
//  Created by Mac on 2017/10/10.
//  Copyright © 2017年 gaofu. All rights reserved.
//

#import "LYCode.h"

@implementation LYCode



+ (void)OpenCodeVcWithCuVc:(UIViewController *)cuVc withResultBlock:(ScanCodeViewControllerBlock)resultBlock
{
    ScanCodeViewController *codeVc = [[UIStoryboard storyboardWithName:@"ScanCodeViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"ScanCodeViewController"];
    
    codeVc.resultBlock = resultBlock;
    
    
    codeVc.hidesBottomBarWhenPushed = YES;
    
    [cuVc.navigationController pushViewController:codeVc animated:YES];
 
}

// 扫描结果


+ (void)AddCodeImageWithString:(NSString *)str  withImage:(UIImage *)image withAddBlock:(LYCodeAddBlock)block;{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
      
        UIImage *codeImage = [str generateQRCodeWithLogo:image];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
    
         if(block!=nil)
         {
             block (codeImage);
         }
            
        });
    });
}

@end
