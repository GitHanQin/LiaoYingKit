//
//  UIDevice+LYDevice.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (LYDevice)
/** mac地址 */
+ (NSString *)ly_macAddress;

/** ram的size */
+ (NSUInteger)ly_ramSize;

/** cpu个数 */
+ (NSUInteger)ly_cpuNumber;

/** 系统的版本号 */
+ (NSString *)ly_systemVersion;

/** 是否有摄像头 */
+ (BOOL)ly_hasCamera;

/** 获取手机内存总量, 返回的是字节数 */
+ (NSUInteger)ly_totalMemoryBytes;

/** 获取手机可用内存, 返回的是字节数 */
+ (NSUInteger)ly_freeMemoryBytes;

/** 获取手机硬盘总空间, 返回的是字节数 */
+ (NSUInteger)ly_totalDiskSpaceBytes;

/** 获取手机硬盘空闲空间, 返回的是字节数 */
+ (NSUInteger)ly_freeDiskSpaceBytes;

@end
