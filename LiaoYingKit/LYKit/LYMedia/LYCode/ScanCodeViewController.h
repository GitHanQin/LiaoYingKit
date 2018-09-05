//
//  ScanCodeViewController.h
//  demo
//
//  Created by gaofu on 2017/4/10.
//  Copyright © 2017年 siruijk. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ScanCodeViewController : UIViewController

//开始扫描
- (void)startScan;

//停止扫描
- (void)stopScan;

// 扫描结果
typedef void(^ScanCodeViewControllerBlock)(NSString *result);

@property (nonatomic,strong)ScanCodeViewControllerBlock resultBlock;


@end
