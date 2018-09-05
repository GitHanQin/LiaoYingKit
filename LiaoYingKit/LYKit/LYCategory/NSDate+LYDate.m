//
//  NSDate+LYDate.m
//  LYKitDemo
//
//  Created by Mac on 2017/10/13.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import "NSDate+LYDate.h"

@implementation NSDate (LYDate)



- (NSUInteger)ly_day {
    return [NSDate ly_day:self];
}

- (NSUInteger)ly_month {
    return [NSDate ly_month:self];
}

- (NSUInteger)ly_year {
    return [NSDate ly_year:self];
}

- (NSUInteger)ly_hour {
    return [NSDate ly_hour:self];
}

- (NSUInteger)ly_minute {
    return [NSDate ly_minute:self];
}

- (NSUInteger)ly_second {
    return [NSDate ly_second:self];
}

+ (NSUInteger)ly_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
    
    return [dayComponents day];
}

+ (NSUInteger)ly_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
    
    return [dayComponents month];
}

+ (NSUInteger)ly_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
    
    return [dayComponents year];
}

+ (NSUInteger)ly_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
    
    return [dayComponents hour];
}

+ (NSUInteger)ly_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
    
    return [dayComponents minute];
}

+ (NSUInteger)ly_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
    
    return [dayComponents second];
}

- (NSUInteger)ly_daysInYear {
    return [NSDate ly_daysInYear:self];
}

+ (NSUInteger)ly_daysInYear:(NSDate *)date {
    return [self ly_isLeapYear:date] ? 366 : 365;
}

- (BOOL)ly_isLeapYear {
    return [NSDate ly_isLeapYear:self];
}

+ (BOOL)ly_isLeapYear:(NSDate *)date {
    NSUInteger year = [date ly_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)ly_formatYMD {
    return [NSDate ly_formatYMD:self];
}

+ (NSString *)ly_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",[date ly_year],[date ly_month], [date ly_day]];
}

- (NSUInteger)ly_weeksOfMonth {
    return [NSDate ly_weeksOfMonth:self];
}

+ (NSUInteger)ly_weeksOfMonth:(NSDate *)date {
    return [[date ly_lastdayOfMonth] ly_weekOfYear] - [[date ly_begindayOfMonth] ly_weekOfYear] + 1;
}

- (NSUInteger)ly_weekOfYear {
    return [NSDate ly_weekOfYear:self];
}

+ (NSUInteger)ly_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date ly_year];
    
    NSDate *lastdate = [date ly_lastdayOfMonth];
    
    for (i = 1;[[lastdate ly_dateAfterDay:-7 * i] ly_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)ly_dateAfterDay:(NSUInteger)day {
    return [NSDate ly_dateAfterDate:self day:day];
}

+ (NSDate *)ly_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)ly_dateAfterMonth:(NSUInteger)month {
    return [NSDate ly_dateAfterDate:self month:month];
}

+ (NSDate *)ly_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)ly_begindayOfMonth {
    return [NSDate ly_begindayOfMonth:self];
}

+ (NSDate *)ly_begindayOfMonth:(NSDate *)date {
    return [self ly_dateAfterDate:date day:-[date ly_day] + 1];
}

- (NSDate *)ly_lastdayOfMonth {
    return [NSDate ly_lastdayOfMonth:self];
}

+ (NSDate *)ly_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self ly_begindayOfMonth:date];
    return [[lastDate ly_dateAfterMonth:1] ly_dateAfterDay:-1];
}

- (NSUInteger)ly_daysAgo {
    return [NSDate ly_daysAgo:self];
}

+ (NSUInteger)ly_daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
    
    
    return [components day];
}

- (NSInteger)ly_weekday {
    return [NSDate ly_weekday:self];
}

+ (NSInteger)ly_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    weekday == 1 ? weekday = 7 : weekday--;
    return weekday;
}

- (NSString *)ly_dayFromWeekday {
    return [NSDate ly_dayFromWeekday:self];
}

+ (NSString *)ly_dayFromWeekday:(NSDate *)date {
    switch([date ly_weekday]) {
        case 7:
            return @"星期天";
            break;
        case 1:
            return @"星期一";
            break;
        case 2:
            return @"星期二";
            break;
        case 3:
            return @"星期三";
            break;
        case 4:
            return @"星期四";
            break;
        case 5:
            return @"星期五";
            break;
        case 6:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)ly_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)ly_isToday {
    return [self ly_isSameDay:[NSDate date]];
}

- (NSDate *)ly_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

+ (NSString *)ly_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)ly_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date ly_stringWithFormat:format];
}

- (NSString *)ly_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)ly_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSUInteger)ly_daysInMonth:(NSUInteger)month {
    return [NSDate ly_daysInMonth:self month:month];
}

+ (NSUInteger)ly_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date ly_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)ly_daysInMonth {
    return [NSDate ly_daysInMonth:self];
}

+ (NSUInteger)ly_daysInMonth:(NSDate *)date {
    return [self ly_daysInMonth:date month:[date ly_month]];
}

- (NSString *)ly_timeInfo {
    return [NSDate ly_timeInfoWithDate:self];
}

+ (NSString *)ly_timeInfoWithDate:(NSDate *)date {
    return [self ly_timeInfoWithDateString:[self ly_stringWithDate:date format:[self ly_ymdHmsFormat]]];
}

+ (NSString *)ly_timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self ly_dateWithString:dateString format:[self ly_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate ly_month] - [date ly_month]);
    int year = (int)([curDate ly_year] - [date ly_year]);
    int day = (int)([curDate ly_day] - [date ly_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate ly_month] == 1 && [date ly_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self ly_daysInMonth:date month:[date ly_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate ly_day] + (totalDays - (int)[date ly_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate ly_month];
            int preMonth = (int)[date ly_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)ly_ymdFormat {
    return [NSDate ly_ymdFormat];
}

- (NSString *)ly_hmsFormat {
    return [NSDate ly_hmsFormat];
}

- (NSString *)ly_ymdHmsFormat {
    return [NSDate ly_ymdHmsFormat];
}

+ (NSString *)ly_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)ly_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)ly_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self ly_ymdFormat], [self ly_hmsFormat]];
}

- (NSDate *)ly_offsetYears:(int)numYears {
    return [NSDate ly_offsetYears:numYears fromDate:self];
}

+ (NSDate *)ly_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)ly_offsetMonths:(int)numMonths {
    return [NSDate ly_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)ly_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)ly_offsetDays:(int)numDays {
    return [NSDate ly_offsetDays:numDays fromDate:self];
}

+ (NSDate *)ly_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)ly_offsetHours:(int)hours {
    return [NSDate ly_offsetHours:hours fromDate:self];
}

+ (NSDate *)ly_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

+(NSString *)ly_stringNowWithFullFormatter {
    NSDate *now=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str=[formatter stringFromDate:now];
    return str;
}

+(NSString *)ly_stringNowWithFormatter:(NSString *)format {
    NSDate *now=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *str=[formatter stringFromDate:now];
    return str;
}

+(NSString *)ly_stringWithTimeInterval:(unsigned int)time Formatter:(NSString *)format {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSTimeZone *localtimezone=[NSTimeZone systemTimeZone];
    NSInteger offset=[localtimezone secondsFromGMT];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:(time-offset)];
    NSString *timeStr=[formatter stringFromDate:date];
    return timeStr;
}

+(NSTimeInterval )ly_now {
    NSDate *now = [NSDate date];
    NSTimeZone *zone=[NSTimeZone systemTimeZone];
    NSInteger offset=[zone secondsFromGMT];
    return  [now timeIntervalSince1970]+offset;
}

+(NSTimeInterval )ly_timeIntervalFromString:(NSString *)timeStr Formatter:(NSString *)format {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSDate *date=[formatter dateFromString:timeStr];
    NSTimeZone *zone=[NSTimeZone systemTimeZone];
    NSInteger offset=[zone secondsFromGMT];
    return  ([date timeIntervalSince1970]+offset);
}




@end
