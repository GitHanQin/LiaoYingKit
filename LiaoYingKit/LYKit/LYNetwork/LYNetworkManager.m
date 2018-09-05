//
//  LYNetworkManager.m
//  LYKitDemo
//
//  Created by Mac on 2017/9/21.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import "LYNetworkManager.h"
#import "LYTools.h"      //工具类
#import  <MJExtension.h> //字典转模型
#import  <MJRefresh.h>   //上下拉刷新
#import <MBProgressHUD.h>  //菊花

#define shareLYNetworkManager [LYNetworkManager sharedLYNetworkManager]

@interface LYNetworkManager()


@end

@implementation LYNetworkManager



#pragma mark————————————单利 配置用
+ (instancetype)sharedLYNetworkManager
{
    static LYNetworkManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[LYNetworkManager alloc]init];
    
        
    });
    
    return instance;
    
}




#pragma mark————————————————————————————————————————请求

/**
 *  GET请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure{

 

    return  [PPNetworkHelper GET:URL parameters:parameters success:^(id responseObject) {
        
        
                if(success!=nil)
                {
                    success(responseObject);
                }
        
            } failure:^(NSError *error) {
         
                
                if(failure!=nil)
                {
                    failure(error);
                }
                
        
            }];


}

/**
 *  GET请求,自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param responseCacheBlock 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                     responseCache:(PPHttpRequestCache)responseCacheBlock
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure{


   
    
    return  [PPNetworkHelper GET:URL parameters:parameters responseCache:^(id responseCache) {
        
        
        
        if(responseCacheBlock!=nil)
        {
            responseCacheBlock(responseCache);
        }
        
    } success:^(id responseObject) {
        
        
         if(success!=nil)
         {
            success(responseObject);
         }
        
    } failure:^(NSError *error) {
        
       
        if(failure!=nil)
        {
            failure(error);
        }
        
        
    }];


}

/**
 *  POST请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                            success:(PPHttpRequestSuccess)success
                            failure:(PPHttpRequestFailed)failure{

 

    return  [PPNetworkHelper POST:URL parameters:parameters success:^(id responseObject) {
        
 
        if(success!=nil)
        {
            success(responseObject);
        }
        
        
    } failure:^(NSError *error) {
        
 
        if(failure!=nil)
        {
            failure(error);
        }
        
    }];



}

/**
 *  POST请求,自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param responseCacheBlock 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                      responseCache:(PPHttpRequestCache)responseCacheBlock
                            success:(PPHttpRequestSuccess)success
                            failure:(PPHttpRequestFailed)failure{
 
    
     return  [PPNetworkHelper POST:URL parameters:parameters responseCache:^(id responseCache) {
        
         
        if(responseCacheBlock!=nil)
        {
            responseCacheBlock(responseCache);
        }
         
         
        
    } success:^(id responseObject) {
        
        
 
        if(success!=nil)
        {
            success(responseObject);
        }
        
         NSLog(@"网络数据:%@",responseObject);
        
    } failure:^(NSError *error) {
        
        
        if(failure!=nil)
        {
            failure(error);
        }
        
        NSLog(@"错误:%@",error);
        
    }];


}

/**
 *  上传文件
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       文件对应服务器上的字段
 *  @param filePath   文件本地的沙盒路径
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                            name:(NSString *)name
                                        filePath:(NSString *)filePath
                                        progress:(PPHttpProgress)progress
                                         success:(PPHttpRequestSuccess)success
                                         failure:(PPHttpRequestFailed)failure{
 

  return   [PPNetworkHelper uploadFileWithURL:URL parameters:parameters name:name filePath:filePath progress:progress success:^(id responseObject) {
      
      
      if(success!=nil)
      {
          success(responseObject);
      }
      
  } failure:^(NSError *error) {
      
 
      if(failure!=nil)
      {
          failure(error);
      }
      
  }];


}

/**
 *  上传单/多张图片
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       图片对应服务器上的字段
 *  @param images     图片数组
 *  @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 *  @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 *  @param imageType  图片文件的类型,例:png、jpg(默认类型)....
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(PPHttpProgress)progress
                                           success:(PPHttpRequestSuccess)success
                                           failure:(PPHttpRequestFailed)failure{


 
    return   [PPNetworkHelper uploadImagesWithURL:URL parameters:parameters name:name images:images fileNames:fileNames imageScale:imageScale imageType:imageType progress:progress success:^(id responseObject) {
        
        
 
        if(success!=nil)
        {
            success(responseObject);
        }
        
    } failure:^(NSError *error) {
        
 
        if(failure!=nil)
        {
            failure(error);
        }
        
    }];



}

/**
 *  下载文件
 *
 *  @param URL      请求地址
 *  @param fileDir  文件存储目录(默认存储目录为Download)
 *  @param progress 文件下载的进度信息
 *  @param success  下载成功的回调(回调参数filePath:文件的路径)
 *  @param failure  下载失败的回调
 *
 *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，开始下载调用resume方法
 */
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(PPHttpProgress)progress
                                       success:(void(^)(NSString *filePath))success
                                       failure:(PPHttpRequestFailed)failure{

    NSString *url =URL;
    

    return   [PPNetworkHelper downloadWithURL:url fileDir:fileDir progress:progress success:^(NSString *filePath) {
        
        if(success!=nil)
        {
            success(filePath);
        }
        
    } failure:^(NSError *error) {
        
        
        if(failure!=nil)
        {
            failure(error);
        }
        
    }];


}







#pragma mark————————————————————————————————————————配置or方法


/**
 有网YES, 无网:NO
 */
+ (BOOL)isNetwork{

    return   [PPNetworkHelper isNetwork];
    

}

/**
 手机网络:YES, 反之:NO
 */
+ (BOOL)isWWANNetwork{


    return   [PPNetworkHelper isWWANNetwork];

}

/**
 WiFi网络:YES, 反之:NO
 */
+ (BOOL)isWiFiNetwork{


    return   [PPNetworkHelper isWiFiNetwork];
}

/**
 取消所有HTTP请求
 */
+ (void)cancelAllRequest{


   [PPNetworkHelper cancelAllRequest];

}

/**
 实时获取网络状态,通过Block回调实时获取(此方法可多次调用)
 */
+ (void)networkStatusWithBlock:(PPNetworkStatus)networkStatus{


    
    [PPNetworkHelper networkStatusWithBlock:networkStatus];

}

/**
 取消指定URL的HTTP请求
 */
+ (void)cancelRequestWithURL:(NSString *)URL{

  [PPNetworkHelper cancelRequestWithURL:URL];
}

/**
 开启日志打印 (Debug级别)
 */
+ (void)openLog{

  [PPNetworkHelper openLog];
}

/**
 关闭日志打印,默认关闭
 */
+ (void)closeLog{

    [PPNetworkHelper closeLog];
}




#pragma mark - 设置AFHTTPSessionManager相关属性
#pragma mark 注意: 因为全局只有一个AFHTTPSessionManager实例,所以以下设置方式全局生效
/**
 在开发中,如果以下的设置方式不满足项目的需求,就调用此方法获取AFHTTPSessionManager实例进行自定义设置
 (注意: 调用此方法时在要导入AFNetworking.h头文件,否则可能会报找不到AFHTTPSessionManager的❌)
 @param sessionManager AFHTTPSessionManager的实例
 */
+ (void)setAFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager{


    [PPNetworkHelper setAFHTTPSessionManagerProperty:sessionManager];

}

/**
 *  设置网络请求参数的格式:默认为二进制格式
 *
 *  @param requestSerializer PPRequestSerializerJSON(JSON格式),PPRequestSerializerHTTP(二进制格式),
 */
+ (void)setRequestSerializer:(PPRequestSerializer)requestSerializer{

    [PPNetworkHelper setRequestSerializer:requestSerializer];

}

/**
 *  设置服务器响应数据格式:默认为JSON格式
 *
 *  @param responseSerializer PPResponseSerializerJSON(JSON格式),PPResponseSerializerHTTP(二进制格式)
 */
+ (void)setResponseSerializer:(PPResponseSerializer)responseSerializer{


     [PPNetworkHelper setResponseSerializer:responseSerializer];
}

/**
 *  设置请求超时时间:默认为30S
 *
 *  @param time 时长
 */
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time{

     [PPNetworkHelper setRequestTimeoutInterval:time];
}

/**
 *  设置请求头
 */
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field{

    [PPNetworkHelper setValue:value forHTTPHeaderField:field];
}

/**
 *  是否打开网络状态转圈菊花:默认打开
 *
 *  @param open YES(打开), NO(关闭)
 */
+ (void)openNetworkActivityIndicator:(BOOL)open{


     [PPNetworkHelper openNetworkActivityIndicator:open];
}

/**
 配置自建证书的Https请求, 参考链接: http://blog.csdn.net/syg90178aw/article/details/52839103
 
 @param cerPath 自建Https证书的路径
 @param validatesDomainName 是否需要验证域名，默认为YES. 如果证书的域名与请求的域名不一致，需设置为NO; 即服务器使用其他可信任机构颁发
 的证书，也可以建立连接，这个非常危险, 建议打开.validatesDomainName=NO, 主要用于这种情况:客户端请求的是子域名, 而证书上的是另外
 一个域名。因为SSL证书上的域名是独立的,假如证书上注册的域名是www.google.com, 那么mail.google.com是无法验证通过的.
 */
+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName{

    [PPNetworkHelper setSecurityPolicyWithCerPath:cerPath validatesDomainName:validatesDomainName];


}




@end
