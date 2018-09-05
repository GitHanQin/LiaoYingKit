//
//  recorderView.h
//  MOKORecorder
//
//  Created by 了赢 on 2018/1/12.
//  Copyright © 2018年 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOKORecordButton.h"

@interface recorderView : NSObject

@property (nonatomic,strong)MOKORecordButton *recordButton;  //传入点击说话的按钮

- (void)configuration; //配置
@end
