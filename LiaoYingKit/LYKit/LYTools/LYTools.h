//
//  LYTools.h
//  LYKitDemo
//
//  Created by Mac on 2017/9/21.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <FFToast.h>      //提醒框
#import "RYDatePicker.h" //时间选择
#import <MobileCoreServices/MobileCoreServices.h>
#import <MJRefresh.h>
#import "LYKit.pch"
#import <SDWebImageManager.h>
#import <SDImageCache.h>


@interface LYTools : NSObject

//时间挫枚举
typedef enum
{
    timeStampTypeA = 0, //年月日时分秒
    timeStampTypeB = 1, //年月日时分
    timeStampTypeC = 2, //年月日时
    timeStampTypeD = 3, //年月日
    timeStampTypeE = 4, //年月
    timeStampTypeF = 5, //年
    timeStampTypeG = 6, //秒
    timeStampTypeH = 7, //分秒
    timeStampTypeI = 8  //时分秒
 
} timeStampType;




/**
 * 圆角
 *  @param view  要设置圆角的view
 *  @param value 圆角度数
 */
+ (void)viewFillet:(UIView *)view andFloat:(CGFloat)value;



/**
 获取当前屏幕显示的viewcontroller 适用范围，tabbar的子视图都是NavigationController，其它情况可以根据情况调整
 */
+ (UIViewController *)getCurrentVC;



/**
 *  谁作为window的rootvc
 *  @param vc 作为根控制器的vc
 *  @param isHaveNavBar 是否添加navbar
*/
+ (void)changeRootVc:(UIViewController *)vc and:(BOOL)isHaveNavBar;




/**
  *  给一个view加阴影
  *  @param view 添加阴影的view
 */
+ (void)viewAddFillet:(UIView *)view;



 


/**
 *  push一个Vc，会隐藏Tabbar
 *  @param cuViewController 当前vc
 *  @param nextVc           要跳转的vc
 */
+ (void)pushNextViewController:(UIViewController *)cuViewController andRootController:(UIViewController *)nextVc;




/**
 *  计算文字高度
 *  @param string 要计算的文字
 *  @param weight 文字控件的宽度
 *  @param font 文字控件的的font
 */
+ (CGFloat)getNSStringSize:(NSString *)string andViewWight:(CGFloat)weight andFont:(NSInteger)font;

/**
 *  计算文字宽度
 *  @param string 要计算的文字
 *  @param weight 文字控件的宽度
 *  @param font 文字控件的的font
 */

+ (CGFloat)getNSStringWith:(NSString *)string andViewWight:(CGFloat)weight andFont:(NSInteger)font;
/**
 *  获取文字首字母(传入汉字字符串, 返回大写拼音首字母)
 *  @param string 要得到首字母的文字
 */

+ (NSString *)getStringInitials:(NSString *)string;


/**
 *  得到当前时间(已经按yyyyMMddHHmmssss格式好的字符串 一般用在上传图片设置文件名称)
 */
+(NSString *)getCuTimeString;




/**
 *  时间搓转格式化好的NSString
 *  @param timeStamp 时间搓
 *  @param type      要转换的时间类型 预留一些，如果不能满足需要 就用下面的自定义格式方法
 */
+(NSString *)timeStampToString:(NSString *)timeStamp wityType:(timeStampType)type;




/**
 *  时间搓转格式化好的NSString
 *  @param timeStamp  时间搓
 *  @param typeString 要转换的时间类型
 */
+(NSString *)timeStampToString:(NSString *)timeStamp wityTypeString:(NSString *)typeString;





/**
 *  NSDate格式化成2017-9-30 12:20:20 这种格式
 *  @param adte 对应的NSDate
 *  @param type      要转换的时间类型 预留一些，如果不能满足需要 就用下面的自定义格式方法
 */
+ (NSString *)NSDateToWork:(NSDate *)adte wityType:(timeStampType)type;





/**
 *  NSDate转成指定 @"yyyy-MM-dd HH:mm:ss"]
 *  @param adte 对应的NSDate
 *  @param str      要转换的时间类型
 */
+ (NSString *)NSDateToWork:(NSDate *)adte  withStr:(NSString *)str;


/**
 *  获取当前设备是否是24小时时间制
 */
+ (BOOL)getDeviceTimeType;



/**
 *  去掉hmtl正则
 *  @param html  要去掉Hmtl标签的字符串
 */
+(NSString *)filterHTML:(NSString *)html;



/**
 *  提取html标签中的图片地址
 *  @param webString  html标签 
 */
+ (NSArray *)getImageurlFromHtml:(NSString *)webString;



/**
 *  View加上边框
 *  @param view  要加上边框的view
 *  @param color 边框颜色
 *  @param radius  要加上边框的view
 */
+ (void)viewAddBorder:(UIView *)view andColor:(UIColor *)color andRadius:(float)radius;



/**
 *  删除View外边框
 *  @param view  要删除边框的view
 */
+ (void)removeViewBorder:(UIView *)view;



/**
 *  给lable中间加上黑线
 *  @param lable  要添加黑线的lable
 */
+ (void)lableAddBlackLine:(UILabel *)lable;





/**
 *  —根据sb来实例化vc并且跳转 (Sbname sb名字  ViewController跳转的vc selfVc 当前vc )注意： sb名字一定要和SB id 一样不然会崩
 *  @param sbName  sb的名称
 *  @param nextVc  sb对应的vc
 *  @param cuVc    当前vc
 */
+ (void)pushSbVcSbname:(NSString *)sbName withNextVc:(UIViewController *)nextVc withCuVc:(UIViewController *)cuVc;





/**
 *
 *  递归 类似@[@[@"黄色",@"红色"],@[@"X号",@"M号"],@[@"全新",@"九成新"]] 这种每个规格都遍历一次 最后的到 黄色 x号 全新, 黄色 x号 九成新..  这种
 *  @param t t默认传一个空数组
 *  @param a 模型数组
 *  @param n 模型数组的长度 count
 *  @param r 要返回的可变数组（必须初始化）
 */
+ (void)f:(NSArray *)t :(NSArray *)a :(long)n  withoverArr:(NSMutableArray *)r;




/**
 *  清除button的点击事件
 *  @param button  请输入事件的button
 */
+ (void)removeAllTargets:(UIButton *)button;



/**
 *  清除view所有约束
 *  @param view  对应的view
 */
+ (void)removeAllAutoLayout:(UIView *)view;


 
/**
 * 清空view子view
 *  @param view  对应的view
 */
+ (void)cleanViewSubviews:(UIView *)view;



/**
 *  把网址改成html标签的字符串
 *  @param url  网址
 */
+ (NSString *)htmlAddressToHtmlString:(NSString *)url;



/**
 *  更改网页内容宽高
 *  @param htmlString  html标签
 */
+ (NSString *)changeHtmlContentSize:(NSString *)htmlString;



/**
 *  UIView转UIImage
 *  @param view  转Image的view
 */
+ (UIImage*)convertViewToImage:(UIView*)view;





/**
 *  unencoded String
 *  @param unencodedString  要unencode得文本
 */
+ (NSString*)encodeString:(NSString*)unencodedString;



/**
 *  添加模糊view
 *  @param rect  模糊view的frame
 *  @param style 模糊样式
 */
+ (UIView *)addBlurView:(CGRect)rect WithStyle:(UIBlurEffectStyle)style;




/**
 *  生成指定位数的随机数
 *  @param stringSize  随机数位数
 */
+(NSString *)getRandomString:(NSInteger)stringSize;





/**
 *  NSDict NSArr 转 json
 *  @param object  转json的字典 或者 数组
 */
+ (NSString*)dataToJsonString:(id)object;






/**
 *  json字符串转NSDict
 *  @param jsonString  json字符串
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;





/**
 *  传入 秒  得到 xx:xx:xx  这种格式
 *  @param totalTime  秒
 */
+(NSString *)getYYMMSSFromSS:(NSString *)totalTime;






/**
 *  传入 秒  得到  xx分钟xx秒
 *  @param totalTime  秒
 */
+(NSString *)getMMSSFromSS:(NSString *)totalTime;




/**
 *  按钮倒计时 倒计时期间 按钮点击不了
 *  @param second  倒计时的秒数
 *  @param button  对应的按钮
 */
+ (void)buttonCountDown:(NSInteger)second  withButton:(UIButton *)button;



/**
 *  是否包含某个字符串
 *  @param str  原有字符串
 *  @param isHaveStr  是否包含的字符串
 */
+ (BOOL)isHaveString:(NSString *)str withHaveStr:(NSString *)isHaveStr;



/**
 *  局部圆角
 *  @param view    执行的view
 *  @param corners 圆角方式
 *  @param size    圆角大小
 */
+ (void)localFillet:(UIView *)view withCorners:(UIRectCorner)corners withFilletSize:(CGSize)size;




/**
 *  给view添加一个敲击手势
 *  @param view     执行的view
 *  @param target   target
 *  @param action   点击执行的方法
 */
+ (void)viewAddTapWithView:(UIView *)view withTarget:(nullable id)target withAction:(nullable SEL)action;

 


/**
 *  手机号正则  YES or NO
 *  @param mobile   手机号
 */
+ (BOOL)phoneValiMobile:(NSString *_Nullable)mobile;




/**
 *  手机号密文
 *  @param phoneStr   手机号
 */
+(NSString *_Nullable)PhoneModel:(NSString *_Nullable)phoneStr;


/**
 *  判断字符是否为空
 *  @param str     对应的string
 */
+(BOOL)stringIsNil:(NSString *_Nullable)str;


/**
 *  SDWebImage加载图片
 *  @param imageView        传UIImageview 或者UIButton都可以
 *  @param imageUrl         图片地址
 *  @param placeholderImage 占位图
 *  @param completedBlock   回调
 */
+ (void)sd_setImageWithimageView:(id)imageView withImageUrl:(NSString *)imageUrl  withPlaceholderImage:(UIImage *)placeholderImage withCompleted:(SDWebImageCompletionBlock)completedBlock;





/**
 增加下拉刷新控件
 
 @param scrollView 指定的控件
 @param target target
 @param action action description方法
 */
+ (void)tableViewAddRefreshHeader:(UIScrollView *)scrollView withTarget:(id)target  refreshingAction:(SEL)action;



/**
 增加上拉加载更多控件
 
 @param scrollView 指定的控件
 @param target target
 @param action action description方法
 */
+ (void)tableViewAddRefreshFooter:(UIScrollView *)scrollView withTarget:(id)target refreshingAction:(SEL)action;


/**
 给lable某段文字颜色
 
 @lable 指定lable
 @colorString 要改变的文字
 @color       改成什么颜色
 */
#pragma mark——————————
+ (void)withLableAddColorWithLable:(UILabel *)lable with:(NSString *)colorString WithColor:(UIColor *)color;


/**
 给lable某段文字大小
 
 @lable 指定lable
 @str 要改变的文字
 @fontSize       改成什么大小
 */

+ (void)withLableAddSizeWithLable:(UILabel *)lable with:(NSString *)str WithFont:(NSInteger )fontSize;




/**
 *  适配ios11导航栏
 *
 *  @param inScroView        显示不对的scroView
 *  @param inVc              所在vc
 */
+ (void)adaptiveSystems_ios11:(UIScrollView *)inScroView withVc:(UIViewController *)inVc;



/**
 对象转json字符串
 
 @param object 对象
 @return       json字符串
 */
+ (NSString*)DataTOjsonString:(id)object;




/**
  获取sdwebImage缓存大小

 @param completionBlock 返回数据大小
 */
+ (void)getSDWebImageChaceSize:(SDWebImageCalculateSizeBlock)completionBlock;


  

/**
 传入UIiamge数组 压缩成最大100kb的数组
 
 @param imgArr 要压缩的图片数组
 @return 压缩完的UIImage数组
 */
+(NSArray *)reduceImageArr:(NSArray *)imgArr;


/**
 弹出默认消息提示
 
 @param str 提醒文字
 */
+(void)showMessage:(NSString *)str;



/**
 弹出指定消息框
 
 @param type 弹出类型
 @param str 提醒文字
 */
+(void)showMessageWithType:(FFToastType)type withStr:(NSString *)str;



/**
 初始化一个时间选择器
 
 @param style 时间类型
 @return 时间选择器对象
 */
+ (RYDatePicker *)showTimePikerWithStyle:(RYDatePickerComponentsStyle)style   didConfirmDate:(void (^)(NSDate *date))confirmBlock;

@end
