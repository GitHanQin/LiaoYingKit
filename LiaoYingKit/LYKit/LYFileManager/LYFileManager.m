//
//  LYFileManager.m
//  LYKitDemo
//
//  Created by Mac on 2017/9/25.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import "LYFileManager.h"


@implementation LYFileManager

#pragma mark - 沙盒目录相关

///沙盒的主目录路径
+ (NSString *)homeDir{
    
    return  [TXFileOperation homeDir];
}

///沙盒中Documents的目录路径
+ (NSString *)documentsDir
{
    return [TXFileOperation documentsDir];
}

///沙盒中Library的目录路径
+ (NSString *)libraryDir{
    
   return  [TXFileOperation libraryDir];
}

///沙盒中Library / Preferences的目录路径
+ (NSString *)preferencesDir{
    
    return  [TXFileOperation preferencesDir];
}

///沙盒中Library / Caches的目录路径
+ (NSString *)cachesDir{
   return [TXFileOperation cachesDir];
}

///沙盒中tmp的目录路径
+ (NSString *)tmpDir{
    
   return   [TXFileOperation tmpDir];
}


#pragma mark - 遍历文件夹
/**
 文件遍历
 
 @param path 目录的绝对路径
 @param deep 是否深遍历
 1. 浅遍历：返回当前目录下的所有文件和文件夹
 2. 深遍历：返回当前目录下及子目录下的所有文件和文件夹
 
 @return 遍历结果数组
 */
+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep
{
   return [TXFileOperation listFilesInDirectoryAtPath:path deep:deep];
}

///遍历沙盒主目录
+ (NSArray *)listFilesInHomeDirectoryByDeep:(BOOL)deep
{
   return [TXFileOperation listFilesInHomeDirectoryByDeep:deep];
}

///遍历Documents目录
+ (NSArray *)listFilesInDocumentDirectoryByDeep:(BOOL)deep
{
    return [TXFileOperation listFilesInDocumentDirectoryByDeep:deep];
}

///遍历Library目录
+ (NSArray *)listFilesInLibraryDirectoryByDeep:(BOOL)deep{
    
     return [TXFileOperation listFilesInLibraryDirectoryByDeep:deep];
}

///遍历Caches目录
+ (NSArray *)listFilesInCachesDirectoryByDeep:(BOOL)deep{
    
     return [TXFileOperation listFilesInCachesDirectoryByDeep:deep];
}

///遍历tmp目录
+ (NSArray *)listFilesInTmpDirectoryByDeep:(BOOL)deep{
    
     return [TXFileOperation listFilesInTmpDirectoryByDeep:deep];
}


#pragma mark - 获取文件属性
///根据key获取文件某个属性
+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key
{
    return [TXFileOperation attributeOfItemAtPath:path forKey:key];
}

///根据key获取文件某个属性(错误信息error)
+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error
{
    return [TXFileOperation attributeOfItemAtPath:path forKey:key error:error];
}

///获取文件属性集合
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path
{
    return [TXFileOperation attributesOfItemAtPath:path];
}

///获取文件属性集合(错误信息error)
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation attributesOfItemAtPath:path error:error];
}


#pragma mark - 创建文件(夹)
///创建文件夹
+ (BOOL)createDirectoryAtPath:(NSString *)path{
    return [TXFileOperation createDirectoryAtPath:path];
}

///创建文件夹(错误信息error)
+ (BOOL)createDirectoryAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation createDirectoryAtPath:path error:error];
}

///创建文件
+ (BOOL)createFileAtPath:(NSString *)path{
    
    return [TXFileOperation createFileAtPath:path];
}

///创建文件(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation createFileAtPath:path error:error];
}

///创建文件, 是否覆盖
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite{
    
    return [TXFileOperation createFileAtPath:path overwrite:overwrite];
}

///创建文件, 是否覆盖(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError **)error{
    
    return [TXFileOperation createFileAtPath:path overwrite:overwrite error:error];
}

///创建文件, 文件内容
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content{
    
    return [TXFileOperation createFileAtPath:path content:content];
}

///创建文件, 文件内容(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error{
    
    return [TXFileOperation createFileAtPath:path content:content error:error];
}

///创建文件, 文件内容是否覆盖
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite{
    
    return [TXFileOperation createFileAtPath:path content:content overwrite:overwrite];
}

///创建文件, 文件内容是否覆盖(错误信息error)
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite error:(NSError **)error{
    
    return [TXFileOperation createFileAtPath:path content:content overwrite:overwrite error:error];
}

///获取创建文件时间
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path{
    
    return [TXFileOperation creationDateOfItemAtPath:path];
}

///获取创建文件时间(错误信息error)
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path error:(NSError **)error
{
    return [TXFileOperation creationDateOfItemAtPath:path error:error];
}


///获取文件修改时间
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path{
    
    return [TXFileOperation modificationDateOfItemAtPath:path];
    
}

///获取文件修改时间(错误信息error)
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation modificationDateOfItemAtPath:path error:error];
}


#pragma mark - 删除文件(夹)
///删除文件
+ (BOOL)removeItemAtPath:(NSString *)path{
    
    return [TXFileOperation removeItemAtPath:path];
}

///删除文件(错误信息error)
+ (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation removeItemAtPath:path error:error];
}

///清空Caches文件夹
+ (BOOL)clearCachesDirectory{
    
    return [TXFileOperation clearCachesDirectory];
}


///清空tmp文件夹
+ (BOOL)clearTmpDirectory{
    
    return [TXFileOperation clearTmpDirectory];
}


#pragma mark - 复制文件(夹)
///复制文件
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath{
    
    return [TXFileOperation copyItemAtPath:path toPath:toPath];
}

///复制文件(错误信息error)
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error{
    
    return [TXFileOperation copyItemAtPath:path toPath:toPath error:error];
}

///复制文件, 是否覆盖
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite{
    
    return [TXFileOperation copyItemAtPath:path toPath:toPath overwrite:overwrite];
}

///复制文件, 是否覆盖(错误信息error)
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error{
    
    return [TXFileOperation copyItemAtPath:path toPath:toPath overwrite:overwrite error:error];
}



#pragma mark - 移动文件(夹)
///移动文件
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath{
    
    return [TXFileOperation moveItemAtPath:path toPath:toPath];
}

///移动文件(错误信息error)
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error{
    
    return [TXFileOperation moveItemAtPath:path toPath:toPath error:error];
}

///移动文件, 是否覆盖
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite{
    
    return [TXFileOperation moveItemAtPath:path toPath:toPath overwrite:overwrite];
}

///移动文件, 是否覆盖(错误信息error)
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error{
    
    return [TXFileOperation moveItemAtPath:path toPath:toPath overwrite:overwrite error:error];
}



#pragma mark - 根据URL获取文件名
///根据文件路径获取文件名称, 是否需要后缀
+ (NSString *)fileNameAtPath:(NSString *)path suffix:(BOOL)suffix{
    
    return [TXFileOperation fileNameAtPath:path suffix:suffix];
}
///获取文件所在的文件夹路径
+ (NSString *)directoryAtPath:(NSString *)path{
    
    return [TXFileOperation directoryAtPath:path];
}
            
///根据文件路径获取文件扩展类型
+ (NSString *)suffixAtPath:(NSString *)path{
    
    return [TXFileOperation suffixAtPath:path];
}

            
#pragma mark - 判断文件(夹)是否存在
///判断文件路径是否存在
+ (BOOL)isExistsAtPath:(NSString *)path{
    
    return [TXFileOperation isExistsAtPath:path];
}

///判断路径是否为空(判断条件是文件大小为0, 或者是文件夹下没有子文件)
+ (BOOL)isEmptyItemAtPath:(NSString *)path{
    
    return [TXFileOperation isEmptyItemAtPath:path];
}

///判断路径是否为空(错误信息error)
+ (BOOL)isEmptyItemAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation isEmptyItemAtPath:path error:error];
}

///判断目录是否是文件夹
+ (BOOL)isDirectoryAtPath:(NSString *)path{
    
    return [TXFileOperation isDirectoryAtPath:path];
}

///判断目录是否是文件夹(错误信息error)
+ (BOOL)isDirectoryAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation isDirectoryAtPath:path error:error];
}

///判断目录是否是文件
+ (BOOL)isFileAtPath:(NSString *)path{
    
    return [TXFileOperation isFileAtPath:path];
}
            
            
///判断目录是否是文件(错误信息error)
+ (BOOL)isFileAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation isFileAtPath:path error:error];
}

///判断目录是否可执行
+ (BOOL)isExecutableItemAtPath:(NSString *)path{
    
    return [TXFileOperation isExecutableItemAtPath:path];
}
            
///判断目录是否可读
+ (BOOL)isReadableItemAtPath:(NSString *)path{
    
    return [TXFileOperation isReadableItemAtPath:path];
}

///判断目录是否可写
+ (BOOL)isWriteableItemAtPath:(NSString *)path{
    
    return [TXFileOperation isWriteableItemAtPath:path];
}



#pragma mark - 获取文件(夹)大小
///获取目录大小
+ (NSNumber *)sizeOfItemAtPath:(NSString *)path{
    
    return [TXFileOperation sizeOfItemAtPath:path];
}

///获取目录大小(错误信息error)
+ (NSNumber *)sizeOfItemAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation sizeOfItemAtPath:path error:error];
}

///获取文件大小
+ (NSNumber *)sizeOfFileAtPath:(NSString *)path{
    
    return [TXFileOperation sizeOfFileAtPath:path];
}
            
            
///获取文件大小(错误信息error)
+ (NSNumber *)sizeOfFileAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation sizeOfFileAtPath:path error:error];
}

///获取文件夹大小
+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path{
    
    return [TXFileOperation sizeOfDirectoryAtPath:path];
}
            
            
///获取文件夹大小(错误信息error)
+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation sizeOfDirectoryAtPath:path error:error];
}


///获取目录大小, 返回格式化后的数值
+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path{
    
    return [TXFileOperation sizeFormattedOfItemAtPath:path];
}

///获取目录大小, 返回格式化后的数值(错误信息error)
+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation sizeFormattedOfItemAtPath:path error:error];
}


///获取文件大小, 返回格式化后的数值
+ (NSString *)sizeFormattedOfFileAtPath:(NSString *)path{
    
    return [TXFileOperation sizeFormattedOfFileAtPath:path];
}

///获取文件大小, 返回格式化后的数值(错误信息error)
+ (NSString *)sizeFormattedOfFileAtPath:(NSString *)path error:(NSError **)error{
    
    return [TXFileOperation sizeFormattedOfFileAtPath:path error:error];
}


///获取文件夹大小, 返回格式化后的数值
+ (NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path{
    
    return [TXFileOperation sizeFormattedOfDirectoryAtPath:path];
}
            
            
///获取文件夹大小, 返回格式化后的数值(错误信息error)
+ (NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path error:(NSError **)error{
    
    
    return [TXFileOperation sizeFormattedOfDirectoryAtPath:path error:error];
}

#pragma mark - 写入文件内容
///写入文件内容
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content{
    
    return [TXFileOperation writeFileAtPath:path content:content];
}
///写入文件内容(错误信息error)
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error{
    
    return [TXFileOperation writeFileAtPath:path content:content error:error];
    
}



@end
