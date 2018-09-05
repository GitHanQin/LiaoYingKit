//
//  NSDate+LYDate.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/13.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LYDate)

/**
 * 根据日期返回字符串
 */
+ (NSString *)ly_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)ly_stringWithFormat:(NSString *)format;
+ (NSDate *)ly_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 根据TimeInterval获取时间字符串,带有时区偏移
 */
+(NSString *)ly_stringWithTimeInterval:(unsigned int)time Formatter:(NSString *)format;
/**
 * 根据字符串和格式获取TimeInterval时间,带有时区偏移
 */
+(NSTimeInterval )ly_timeIntervalFromString:(NSString *)timeStr Formatter:(NSString *)format;

/**
 * 当前TimeInterval时间,带有时区偏移
 */
+(NSTimeInterval )ly_now;

/**
 * yyyy-MM-dd HH:mm:ss格式的当前时间
 */
+(NSString *)ly_stringNowWithFullFormatter;

/**
 * 自定义格式的当前时间
 */
+(NSString *)ly_stringNowWithFormatter:(NSString *)format;


/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)ly_day;
- (NSUInteger)ly_month;
- (NSUInteger)ly_year;
- (NSUInteger)ly_hour;
- (NSUInteger)ly_minute;
- (NSUInteger)ly_second;
+ (NSUInteger)ly_day:(NSDate *)date;
+ (NSUInteger)ly_month:(NSDate *)date;
+ (NSUInteger)ly_year:(NSDate *)date;
+ (NSUInteger)ly_hour:(NSDate *)date;
+ (NSUInteger)ly_minute:(NSDate *)date;
+ (NSUInteger)ly_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)ly_daysInYear;
+ (NSUInteger)ly_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)ly_isLeapYear;
+ (BOOL)ly_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)ly_weekOfYear;
+ (NSUInteger)ly_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)ly_formatYMD;
+ (NSString *)ly_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)ly_weeksOfMonth;
+ (NSUInteger)ly_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)ly_begindayOfMonth;
+ (NSDate *)ly_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)ly_lastdayOfMonth;
+ (NSDate *)ly_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)ly_dateAfterDay:(NSUInteger)day;
+ (NSDate *)ly_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day月后的日期(若month为负数,则为|month|月前的日期)
 */
- (NSDate *)ly_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)ly_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)ly_offsetYears:(int)numYears;
+ (NSDate *)ly_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)ly_offsetMonths:(int)numMonths;
+ (NSDate *)ly_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)ly_offsetDays:(int)numDays;
+ (NSDate *)ly_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)ly_offsetHours:(int)hours;
+ (NSDate *)ly_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)ly_daysAgo;
+ (NSUInteger)ly_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 */
- (NSInteger)ly_weekday;
+ (NSInteger)ly_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 */
- (NSString *)ly_dayFromWeekday;
+ (NSString *)ly_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 */
- (BOOL)ly_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 */
- (BOOL)ly_isToday;

/**
 *  增加
 */
- (NSDate *)ly_dateByAddingDays:(NSUInteger)days;

/**
 *  获得NSString的月份
 */
+ (NSString *)ly_monthWithMonthNumber:(NSInteger)month;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)ly_daysInMonth:(NSUInteger)month;
+ (NSUInteger)ly_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)ly_daysInMonth;
+ (NSUInteger)ly_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)ly_timeInfo;
+ (NSString *)ly_timeInfoWithDate:(NSDate *)date;
+ (NSString *)ly_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)ly_ymdFormat;
- (NSString *)ly_hmsFormat;
- (NSString *)ly_ymdHmsFormat;
+ (NSString *)ly_ymdFormat;
+ (NSString *)ly_hmsFormat;
+ (NSString *)ly_ymdHmsFormat;



@end
