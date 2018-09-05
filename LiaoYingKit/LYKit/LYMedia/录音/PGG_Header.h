//
//  PGG_Header.h
//  GZYJ
//
//  Created by 了赢 on 2018/1/29.
//  Copyright © 2018年 Mac. All rights reserved.
//

#ifndef PGG_Header_h
#define PGG_Header_h
#import "UIView+Geometry.h"

#define    k_MARGIN    15
#define    kScreen_Width [UIScreen mainScreen].bounds.size.width
#define    kScreen_Height [UIScreen mainScreen].bounds.size.height
#define    kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define    kStatusBar_Height kDevice_Is_iPhoneX?44:20
#define    kTableView_Height kDevice_Is_iPhoneX?88:64
#define    kHeight_Marg kDevice_Is_iPhoneX?90:60
#define    kPhotoHeight_Marg kDevice_Is_iPhoneX?120:90
#define RGBColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif /* PGG_Header_h */
