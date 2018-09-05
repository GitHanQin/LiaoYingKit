//
//  LYTools.m
//  LYKitDemo
//
//  Created by Mac on 2017/9/21.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import "LYTools.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import <SDWebImageManager.h>
#import <objc/runtime.h>

@implementation LYTools


/**
 圆角
*/

+ (void)viewFillet:(UIView *)view andFloat:(CGFloat)value
{
    
    view .layer.cornerRadius =value;
    view .layer.masksToBounds=YES;
    
}





/**
 获取当前屏幕显示的viewcontroller 适用范围，tabbar的子视图都是NavigationController，其它情况可以根据情况调整
*/

+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
        //<span style="font-family: Arial, Helvetica, sans-serif;">//  这方法下面有详解    </span>
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    
    return result;
    
    
}



/**
 谁作为window的rootvc vc:根控制器  isHaveNavBar：是否有navbar
 */
+ (void)changeRootVc:(UIViewController *)vc and:(BOOL)isHaveNavBar
{
    if(isHaveNavBar)
    {
        
        
        UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:vc];
        [UIApplication sharedApplication].delegate.window.rootViewController = nav;
        
    }
    else
    {
        [UIApplication sharedApplication].delegate.window.rootViewController = vc;
        
    }

}


/**
 给一个view加阴影
 */
+ (void)viewAddFillet:(UIView *)view
{

    //阴影的颜色
    
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    //阴影的透明度
    
    view.layer.shadowOpacity = 0.8f;
    //阴影的圆角
    
    view.layer.shadowRadius = 4.f;
    //阴影偏移量
    
    view.layer.shadowOffset = CGSizeMake(1,1);
 
}

 

/**
 *  push一个Vc，会隐藏Tabbar
 *  @param cuViewController 当前vc
 *  @param nextVc           要跳转的vc
 */
+ (void)pushNextViewController:(UIViewController *)cuViewController andRootController:(UIViewController *)nextVc
{

    
    nextVc.hidesBottomBarWhenPushed = YES;
    
    [cuViewController.navigationController pushViewController:nextVc
                                                       animated:YES];
    

}


/**
 *  计算文字高度
 *  @param string 要计算的文字
 *  @param weight 文字控件的宽度
 *  @param font 文字控件的的font
 */
+ (CGFloat)getNSStringSize:(NSString *)string andViewWight:(CGFloat)weight andFont:(NSInteger)font
{

    NSDictionary* attrs =@{NSFontAttributeName:[UIFont systemFontOfSize:font]};
                           
    
     return [string boundingRectWithSize:CGSizeMake(weight, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.height;


}


/**
 *  计算文字宽度
 *  @param string 要计算的文字
 *  @param weight 文字控件的宽度
 *  @param font 文字控件的的font
 */
+ (CGFloat)getNSStringWith:(NSString *)string andViewWight:(CGFloat)weight andFont:(NSInteger)font
{
    
    NSDictionary* attrs =@{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    
    
    return [string boundingRectWithSize:CGSizeMake(weight, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    
    
}
/**
 *  获取文字首字母(传入汉字字符串, 返回大写拼音首字母)
 *  @param string 要得到首字母的文字
 */

+ (NSString *)getStringInitials:(NSString *)string
{
    if(string==nil)
    {
        return @"";
    }

    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:string];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];

}



/**
 *  得到当前时间(已经按yyyyMMddHHmmssss格式好的字符串 一般用在上传图片设置文件名称)
 */
+(NSString *)getCuTimeString
{

    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];//获取当前日期
    [formater setDateFormat:@"yyyyMMddHHmmssss"];//这里去掉 具体时间 保留日期
    NSString * curTime = [formater stringFromDate:curDate];
 
    return curTime;
}





/**
 *  时间搓转格式化好的NSString  有预置类型
 *  @param timeStamp 时间搓
 *  @param type      要转换的时间类型 预留一些，如果不能满足需要 就用下面的自定义格式方法
 */
+(NSString *)timeStampToString:(NSString *)timeStamp wityType:(timeStampType)type{


    NSArray *timeTypeArr = @[@"yyyy-MM-dd HH:mm:ss",@"yyyy-MM-dd HH:mm",@"yyyy-MM-dd HH",@"yyyy-MM-dd",@"yyyy-MM",@"yyyy",@"ss",@"mm:ss",@"HH:mm:ss"];
 
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:timeTypeArr[type]];
 
    double timeInt = 0;
    
    if([timeStamp doubleValue]>10000000000)
    {
        timeInt =  [timeStamp doubleValue]/1000;
    }
    else
    {
        timeInt = [timeStamp doubleValue];
    }
    
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
    
 
    NSString *myNewDateString = [formatter stringFromDate:date1];
    
    return myNewDateString;

}




/**
 *  时间搓转格式化好的NSString
 *  @param timeStamp  时间搓
 *  @param typeString 要转换的时间类型
 */
+(NSString *)timeStampToString:(NSString *)timeStamp wityTypeString:(NSString *)typeString{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:typeString];
    
    double timeInt = 0;
    
    if([timeStamp doubleValue]>10000000000)
    {
        timeInt =  [timeStamp doubleValue]/1000;
    }
    else
    {
        timeInt = [timeStamp doubleValue];
    }
    
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
    
    
    NSString *myNewDateString = [formatter stringFromDate:date1];
    
    return myNewDateString;
    
}





/**
 *  NSDate格式化成2017-9-30 12:20:20 这种格式
 *  @param adte 对应的NSDate
 *  @param type      要转换的时间类型 预留一些，如果不能满足需要 就用下面的自定义格式方法
 */
+ (NSString *)NSDateToWork:(NSDate *)adte wityType:(timeStampType)type{
    
    
    NSArray *timeTypeArr = @[@"yyyy-MM-dd HH:mm:ss",@"yyyy-MM-dd HH:mm",@"yyyy-MM-dd HH",@"yyyy-MM-dd",@"yyyy-MM",@"yyyy",@"ss",@"mm:ss",@"HH:mm:ss"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:timeTypeArr[type]];
    
    NSString *strDate = [dateFormatter stringFromDate:adte];
    
    return strDate;
    
}




/**
 *  NSDate转成指定 @"yyyy-MM-dd HH:mm:ss"]
 *  @param adte 对应的NSDate
 *  @param str      要转换的时间类型
 */
+ (NSString *)NSDateToWork:(NSDate *)adte  withStr:(NSString *)str{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:str];
    NSString *strDate = [dateFormatter stringFromDate:adte];
    
    return strDate;
    
}





/**
 *  获取当前设备是否是24小时时间制
 */
+ (BOOL)getDeviceTimeType
{
    
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    
    BOOL hasAMPM = containsA.location != NSNotFound;
    
    return hasAMPM;
    
    //hasAMPM==TURE为12小时制，否则为24小时制


}




/**
 *  去掉hmtl正则
 *  @param html  要去掉Hmtl标签的字符串
 */
+(NSString *)filterHTML:(NSString *)html
{

    if(html==nil)
    {
        return @"";
    }

    NSScanner * scanner = [NSScanner scannerWithString:html];
 
    NSString * text = nil;
    
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    // NSString * regEx = @"<([^>]*)>";
    // html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;


}


/**
 *  提取html标签中的图片地址
 *  @param webString  html标签
 */
+ (NSArray *)getImageurlFromHtml:(NSString *)webString
{
    NSMutableArray * imageurlArray = @[].mutableCopy;
    
    //标签匹配
    NSString *parten = @"<img(.*?)>";
    NSError* error = NULL;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:parten options:0 error:&error];
    
    NSArray* match = [reg matchesInString:webString options:0 range:NSMakeRange(0, [webString length] - 1)];
    
    for (NSTextCheckingResult * result in match) {
        
        //过去数组中的标签
        NSRange range = [result range];
        NSString * subString = [webString substringWithRange:range];
        
        
        //从图片中的标签中提取ImageURL
        NSRegularExpression *subReg = [NSRegularExpression regularExpressionWithPattern:@"http://(.*?)\"" options:0 error:NULL];
        NSArray* match = [subReg matchesInString:subString options:0 range:NSMakeRange(0, [subString length] - 1)];
        NSTextCheckingResult * subRes = match[0];
        NSRange subRange = [subRes range];
        subRange.length = subRange.length -1;
        NSString * imagekUrl = [subString substringWithRange:subRange];
        
        //将提取出的图片URL添加到图片数组中
        [imageurlArray addObject:imagekUrl];
    }
    return imageurlArray;

}





/**
 *  View加上边框
 *  @param view  要加上边框的view
 *  @param color 边框颜色
 *  @param radius  要加上边框的view
 */
+ (void)viewAddBorder:(UIView *)view andColor:(UIColor *)color andRadius:(float)radius{


    view.layer.cornerRadius = radius;
    view.layer.masksToBounds = YES;
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = 1.0f;
 
}



/**
 *  删除View外边框
 *  @param view  要删除边框的view
 */
+ (void)removeViewBorder:(UIView *)view{



    view.layer.cornerRadius = 0;
    view.layer.masksToBounds = NO;
    view.layer.borderColor = [UIColor clearColor].CGColor;
    view.layer.borderWidth = 0.0f;


}






/**
 *  给lable中间加上黑线
 *  @param lable  要添加黑线的lable
 */
+ (void)lableAddBlackLine:(UILabel *)lable{

 
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:lable.text];
    
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, lable.text.length)];
    
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, lable.text.length)];
    
    [lable setAttributedText:attri];


}



/**
 *  —根据sb来实例化vc并且跳转 (Sbname sb名字  ViewController跳转的vc selfVc 当前vc )注意： sb名字一定要和SB id 一样不然会崩
 *  @param sbName  sb的名称
 *  @param nextVc  sb对应的vc
 *  @param cuVc    当前vc
 */
+ (void)pushSbVcSbname:(NSString *)sbName withNextVc:(UIViewController *)nextVc withCuVc:(UIViewController *)cuVc
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    nextVc = [sb instantiateViewControllerWithIdentifier:sbName];
    
    [LYTools pushNextViewController:cuVc andRootController:cuVc];
}




/**
 *
 *  递归 类似@[@[@"黄色",@"红色"],@[@"X号",@"M号"],@[@"全新",@"九成新"]] 这种每个规格都遍历一次 最后的到 黄色 x号 全新, 黄色 x号 九成新..  这种
 *  @param t t默认传一个空数组
 *  @param a 模型数组
 *  @param n 模型数组的长度 count
 *  @param r 要返回的可变数组（必须初始化）
 */
+ (void)f:(NSArray *)t :(NSArray *)a :(long)n  withoverArr:(NSMutableArray *)r
{


    if(n==0)//到第0个角标的时候 就遍历完一次 添加到数组
    {
        
        [r addObject:t];
        
        return ;
        
    }
    
    for (int i=0; i<[a[n-1] count]; i++) {
        
        
        //不能改变原始的t 所以没有用t直接add
        NSMutableArray *muArr = [NSMutableArray arrayWithArray:t];
        [ muArr addObject:a[n-1][i]];
        
        
        [self f:muArr :a :n-1 withoverArr:r];
    }


}




/**
 *  清除button的点击事件
 *  @param button  请输入事件的button
 */
+ (void)removeAllTargets:(UIButton *)button{

    for (id target in [button allTargets])
    {
        [button removeTarget:target action:NULL forControlEvents:UIControlEventAllEvents];
    }

}



/**
 *  清除view所有约束
 *  @param view  对应的view
 */
+ (void)removeAllAutoLayout:(UIView *)view{

    [view removeConstraints:view.constraints];
    
    for (NSLayoutConstraint *constraint in view.superview.constraints)
    {
        if ([constraint.firstItem isEqual:view])
        {
            [view.superview removeConstraint:constraint];
        }
    }

 
}


/**
 * 清空view子view
 *  @param view  对应的view
 */
+ (void)cleanViewSubviews:(UIView *)view{
    
    for (UIView *sonView in view.subviews) {
        [sonView removeFromSuperview];
    }
    
}





/**
 *  把网址改成html标签的字符串
 *  @param url  网址
 */
+ (NSString *)htmlAddressToHtmlString:(NSString *)url{

    if(url!=nil)
    {
        return  [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:url]
                                               encoding:NSUTF8StringEncoding error:nil];
    }
    
    return @"";

}



/**
 *  更改网页内容宽高
 *  @param htmlString  html标签
 */
+ (NSString *)changeHtmlContentSize:(NSString *)htmlString{

    //内容宽度
    CGFloat contentWidth = [UIScreen mainScreen].bounds.size.width-20;
    
    if(htmlString!=nil)
    {
        //先更改文字宽度
        NSString *lablestr = [NSString stringWithFormat:@"<body width=%fpx style=\"word-wrap:break-word; font-family:Arial\">%@",contentWidth, htmlString];
        
        //更改图片高度
        return [NSString stringWithFormat:@"<head><style>img{width:%fpx !important;height: auto;}</style></head>%@",contentWidth, lablestr];
        
    }
    
    return @"";
 
}


 
/**
 *  UIView转UIImage
 *  @param view  转Image的view
 */
+ (UIImage*)convertViewToImage:(UIView*)view{

    CGSize s = view.bounds.size;
    
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;


}




/**
 *  unencoded String
 *  @param unencodedString  要unencode得文本
 */
+ (NSString*)encodeString:(NSString*)unencodedString
{
    
    if(unencodedString==nil)
    {
        return @"";
    }

    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}






/**
 *  添加模糊view
 *  @param rect  模糊view的frame
 *  @param style 模糊样式
 */
+ (UIView *)addBlurView:(CGRect)rect WithStyle:(UIBlurEffectStyle)style
{
    //模糊效果
    UIView *BlurView;
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 8.0f) {
        
        
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:style];
        BlurView = [[UIVisualEffectView alloc] initWithEffect:blur];
        ((UIVisualEffectView *)BlurView).frame =rect;
        
        
        
    }else{
        
        BlurView = [[UIToolbar alloc] initWithFrame:rect];
        ((UIToolbar *)BlurView).barStyle = UIBarStyleDefault;
        
    }
    
    return BlurView;
}




/**
 *  生成指定位数的随机数
 *  @param stringSize  随机数位数
 */
+(NSString *)getRandomString:(NSInteger)stringSize

{
    
    char data[stringSize];
    
    for (int x=0;x<stringSize;data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    return [[NSString alloc] initWithBytes:data length:stringSize encoding:NSUTF8StringEncoding];
    
}



/**
 *  NSDict NSArr 转 json
 *  @param object  转json的字典 或者 数组
 */
+ (NSString*)dataToJsonString:(id)object
{
    if(object==nil)
    {
        return @"";
    }
    
    if([object isKindOfClass:[NSDictionary class]])
    {
        
        
        //去掉一些转换不了的属性
        NSMutableDictionary *muDict = [NSMutableDictionary dictionaryWithDictionary:object];
        
        for (id sonObj in muDict.allKeys) {
            
            if([muDict[sonObj] isKindOfClass:[NSData class]])
            {
                
                [muDict removeObjectForKey:sonObj];
                
            }
            
        }
        
        
        NSString *jsonString = nil;
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:muDict
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
            
            return @"";
        } else {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        
        return jsonString;
    }
    else if ([object isKindOfClass:[NSArray class]])
    {
        
        
        if([object count] >0)
        {
            NSString *jsonString = nil;
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                               options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                 error:&error];
            if (! jsonData) {
                NSLog(@"Got an error: %@", error);
                
                return @"";
            } else {
                jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            }
            
            
            return jsonString;
        }
        
        
        
    }
    
    return @"";
    
}


/**
 *  json字符串转NSDict
 *  @param jsonString  json字符串
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    
    if([jsonString isKindOfClass:[NSDictionary class]])
    {
        
        return (NSDictionary *)jsonString;
        
    }
    
    
    
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}









/**
 *  传入 秒  得到 xx:xx:xx  这种格式
 *  @param totalTime  秒
 */
+(NSString *)getYYMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}






/**
 *  传入 秒  得到  xx分钟xx秒
 *  @param totalTime  秒
 */
+(NSString *)getMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    
    //NSLog(@"format_time : %@",format_time);
    
    return format_time;
    
}





/**
 *  按钮倒计时 倒计时期间 按钮点击不了
 *  @param second  倒计时的秒数
 *  @param button  对应的按钮
 */
+ (void)buttonCountDown:(NSInteger)second  withButton:(UIButton *)button
{
    __block NSInteger blockSecond= second;
    
    
    button.userInteractionEnabled = NO;
    
    
    
    NSString *buttonString = button.titleLabel.text;
    
    UIColor *btnColor = button.titleLabel.textColor;
    
    [button setTitle:@"哈哈" forState:UIControlStateNormal];
    
    
    
    [button setTitle:[NSString stringWithFormat:@"重新获取(%d)",60] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second > 0) {
                
                [button setTitle:[NSString stringWithFormat:@"重新获取(%ld)",(long)second] forState:UIControlStateNormal];
                
                
                
                blockSecond--;
                
                
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    button.userInteractionEnabled = YES;
                    
                    
                    
                    [button setTitle:buttonString forState:UIControlStateNormal];
                    
                    [button setTitleColor:btnColor forState:UIControlStateNormal];
                    
                });
                
                
            }
        });
    });
    //启动源
    dispatch_resume(timer);
    
    
}





/**
 *  是否包含某个字符串
 *  @param str  原有字符串
 *  @param isHaveStr  是否包含的字符串
 */
+ (BOOL)isHaveString:(NSString *)str withHaveStr:(NSString *)isHaveStr
{
    
    if(str!=nil&&isHaveStr!=nil)
    {
        
        //判断roadTitleLab.text 是否含有qingjoin
        if([str rangeOfString:isHaveStr].location !=NSNotFound)//_roaldSearchText
        {
            
            return YES;
        }
        
    }
    
    
    
    return NO;
    
}





/**
 *  局部圆角
 *  @param view    执行的view
 *  @param corners 圆角方式
 *  @param size    圆角大小
 */
+ (void)localFillet:(UIView *)view withCorners:(UIRectCorner)corners withFilletSize:(CGSize)size

{
    
    //局部圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    view.layer.mask = maskLayer;
    
}




/**
 *  给view添加一个敲击手势
 *  @param view     执行的view
 *  @param target   target
 *  @param action   点击执行的方法
 */
+ (void)viewAddTapWithView:(UIView *)view withTarget:(nullable id)target withAction:(nullable SEL)action
{
    
    view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    
    [view addGestureRecognizer:singleRecognizer];
    
}


/**
 *  手机号正则  YES or NO
 *  @param mobile   手机号
 */
+ (BOOL)phoneValiMobile:(NSString *_Nullable)mobile
{
    if (mobile==nil)
    {
        return  NO;
    }
    
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    
    return NO;
}






/**
 *  手机号密文
 *  @param phoneStr   手机号
 */
+(NSString *_Nullable)PhoneModel:(NSString *_Nullable)phoneStr{
    
    if([self phoneValiMobile:phoneStr]==NO)
    {
        return @"";
    }
    NSString *phone=[NSString stringWithFormat:@"%@****%@",[phoneStr substringToIndex:3],[[phoneStr substringFromIndex:7] substringToIndex:4]];
    return phone;
}








/**
 *  判断字符是否为空
 *  @param str     对应的string
 */
+(BOOL)stringIsNil:(NSString *_Nullable)str{
    
    if ([str isKindOfClass:[NSNull class]]||[str isEqualToString:@""]||str==nil) {
        return YES;
    }
    return  NO;
}



/**
 *  SDWebImage加载图片
 *  @param imageView        传UIImageview 或者UIButton都可以
 *  @param imageUrl         图片地址
 *  @param placeholderImage 占位图
 *  @param completedBlock   回调
 */
+ (void)sd_setImageWithimageView:(id)imageView withImageUrl:(NSString *)imageUrl  withPlaceholderImage:(UIImage *)placeholderImage withCompleted:(SDWebImageCompletionBlock)completedBlock{
    
    if([imageUrl isKindOfClass:[NSNull class]])
    {
        imageUrl = @"";
    }
    
    
    if([imageView isKindOfClass:[UIButton class]])
    {
//        [(UIButton *)imageView   sd_setImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal placeholderImage:placeholderImage];
        [(UIButton *)imageView sd_setBackgroundImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal placeholderImage:placeholderImage];
        
    }else if([imageView isKindOfClass:[UIImageView class]])
    {
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:placeholderImage completed:completedBlock];
    }
    
    
    
}




/**
 增加下拉刷新控件

 @param scrollView 指定的控件
 @param target target
 @param action action description方法
 */
+ (void)tableViewAddRefreshHeader:(UIScrollView *)scrollView withTarget:(id)target  refreshingAction:(SEL)action
{
    
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    //
    //    //隐藏刷新时间
    //    MJRefreshStateHeader *header = (MJRefreshStateHeader *)scrollView.mj_header;
    //
    //    header.lastUpdatedTimeLabel.hidden = YES;
    
}



/**
 增加上拉加载更多控件
 
 @param scrollView 指定的控件
 @param target target
 @param action action description方法
 */
+ (void)tableViewAddRefreshFooter:(UIScrollView *)scrollView withTarget:(id)target refreshingAction:(SEL)action
{
    scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
}



/**
 给lable某段文字颜色

 @lable 指定lable
 @colorString 要改变的文字
 @color       改成什么颜色
 */
#pragma mark——————————
+ (void)withLableAddColorWithLable:(UILabel *)lable with:(NSString *)colorString WithColor:(UIColor *)color{
    
    if(colorString!=nil)
    {
        NSRange range1 = [lable.text rangeOfString:colorString];
        NSMutableAttributedString *richText =[[NSMutableAttributedString alloc]initWithAttributedString:lable.attributedText];
        [richText addAttribute:NSForegroundColorAttributeName value:color range:range1];
        lable.attributedText = richText;
    }
}


/**
 给lable某段文字大小
 
 @lable 指定lable
 @str 要改变的文字
 @fontSize       改成什么大小
 */

+ (void)withLableAddSizeWithLable:(UILabel *)lable with:(NSString *)str WithFont:(NSInteger )fontSize{
    
    
    if(str!=nil)
    {
        NSRange range1 = [lable.text rangeOfString:str];
        NSMutableAttributedString *richText =[[NSMutableAttributedString alloc]initWithAttributedString:lable.attributedText];
        
        //文字大小
        [richText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range1];
        
        lable.attributedText = richText;
    }
    
}



/**
 *  适配ios11导航栏
 *
 *  @param inScroView        显示不对的scroView
 *  @param inVc              所在vc
 */
+ (void)adaptiveSystems_ios11:(UIScrollView *)inScroView withVc:(UIViewController *)inVc
{
    if (@available(iOS 11.0, *)) {
        inScroView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        inVc.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}




/**
 对象转json字符串
 
 @param object 对象
 @return       json字符串
 */
+ (NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


#pragma mark————————————————获取sdwebImage缓存大小
+ (void)getSDWebImageChaceSize:(SDWebImageCalculateSizeBlock)completionBlock{
    
    [SDWebImageManager.sharedManager.imageCache
     calculateSizeWithCompletionBlock:completionBlock];
    
    //    NSLog(@"有%d张图片 缓存%.2fM",fileCount,totalSize / 1024.0 / 1024.0);
    
}







/**
 传入UIiamge数组 压缩成最大100kb的数组
 
 @param imgArr 要压缩的图片数组
 @return 压缩完的UIImage数组
 */
+(NSArray *)reduceImageArr:(NSArray *)imgArr
{
    
    NSMutableArray *muArr = [NSMutableArray array];
    
    //压缩
    for (UIImage *img in imgArr) {
        
        //最大100kb
        NSData *imgData =   [img ly_compressWithMaxLength:1024*100];
        
        UIImage *reduceImage =  [UIImage imageWithData:imgData];
        
        [muArr addObject:reduceImage];
        
    }
    
    return muArr;
}








/**
 拨打电话
 
 @param phone 电话号码
 */
+ (void)CallPhone:(NSString *)phone{
    
    if(![self stringIsNil:phone])
    {
        NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phone];
        // NSLog(@"str======%@",str);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
        
    }
    else
    {
        [self showMessage:@"电话号码为空"];
    }
    
}



/**
 弹出默认消息提示

 @param str 提醒文字
 */
+(void)showMessage:(NSString *)str{
    
    if(![self stringIsNil:str])
    {
        FFToast *toast =  [[FFToast alloc]initToastWithTitle:nil message:str iconImage:nil];
        
        toast.duration = 2;
        
        toast.toastPosition = FFToastPositionBottomWithFillet;
        
        toast.toastType = FFToastTypeDefault;
        
        toast.autoDismiss = YES;
        
        [toast show];
    }
    
}



/**
 弹出指定消息框

 @param type 弹出类型
 @param str 提醒文字
 */
+(void)showMessageWithType:(FFToastType)type withStr:(NSString *)str{
    
    if(![self stringIsNil:str])
    {
        FFToast *toast =  [[FFToast alloc]initToastWithTitle:nil message:str iconImage:nil];
        
        toast.duration = 2;
        
        toast.toastPosition = FFToastPositionCentreWithFillet;
        
        toast.toastType = type;
        
        toast.autoDismiss = YES;
        
        [toast show];
    }
    
}


/**
 初始化一个时间选择器
 
 @param style 时间类型
 @return 时间选择器对象
 */
+ (RYDatePicker *)showTimePikerWithStyle:(RYDatePickerComponentsStyle)style   didConfirmDate:(void (^)(NSDate *date))confirmBlock
{
    
    RYDatePicker *piker = [RYDatePicker pickerWithStyle:kRYDatePickerComponentsStyleYearMonthDayHourMinute didConfirmDate:confirmBlock];
    
    return piker;
    
    
}
@end
