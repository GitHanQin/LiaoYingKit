//
//  NSTimer+LYTimer.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimerCallback)(NSTimer *timer);

@interface NSTimer (LYTimer)

+ (NSTimer *)ly_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                      callback:(TimerCallback)callback;

+ (NSTimer *)ly_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         count:(NSInteger)count
                                      callback:(TimerCallback)callback;

/** 暂停NSTimer */
- (void)ly_pauseTimer;

/** 开始NSTimer */
- (void)ly_resumeTimer;

/** 延迟开始NSTimer */
- (void)ly_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
