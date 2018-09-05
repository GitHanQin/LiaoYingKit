//
//  Define_UI.h
//  LYKitDemo
//
//  Created by 了赢 on 2018/6/7.
//  Copyright © 2018年 www.ly.LYKit. All rights reserved.
//

#ifndef Define_UI_h
#define Define_UI_h


/** 字体大小 */
#define LY_FONT(NAME,FONTSIZE) [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define LY_S_FONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define LY_S_BOLD_FONT(FONTSIZE)   [UIFont boldSystemFontOfSize:FONTSIZE]


/** 颜色(RGB) */
#define LY_RGB(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define LY_RGBA(r,g,b,a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/** 颜色(0xFFFFFF) */
#define LY_HEX_RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define LY_HEX_RGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


/** 资源路径 */
#define LY_PNG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define LY_JPG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define LY_PATH(NAME,EXT) [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

/** 加载图片 */
#define LY_PNG_IMAGE_FILE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define LY_JPG_IMAGE_FILE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define LY_IMAGE_FILE(NAME,EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
#define LY_IMAGE_NAMED(NAME)       [UIImage imageNamed:NAME]

#endif /* Define_UI_h */
