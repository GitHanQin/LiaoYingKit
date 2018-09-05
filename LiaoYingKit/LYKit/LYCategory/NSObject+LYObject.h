//
//  NSObject+LYObject.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^KVOBlock)(NSDictionary *change, void *context);

@interface NSObject (LYObject)

+ (NSString *)ly_version;

+ (NSInteger)ly_build;

+ (NSString *)ly_identifier;

+ (NSString *)ly_currentLanguage;

+ (NSString *)ly_deviceModel;

- (void)ly_addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
          withBlock:(KVOBlock)block;

-(void)ly_removeBlockObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath;

-(void)ly_addObserverForKeyPath:(NSString *)keyPath
                     options:(NSKeyValueObservingOptions)options
                     context:(void *)context
                   withBlock:(KVOBlock)block;

-(void)ly_removeBlockObserverForKeyPath:(NSString *)keyPath;

//类名
- (NSString *)ly_className;
+ (NSString *)ly_className;

//父类名称
- (NSString *)ly_superClassName;
+ (NSString *)ly_superClassName;

//实例属性字典
-(NSDictionary *)ly_propertyDictionary;

//属性名称列表
- (NSArray *)ly_propertyKeys;
+ (NSArray *)ly_propertyKeys;

//方法列表
-(NSArray *)ly_methodList;
+(NSArray *)ly_methodList;

-(NSArray *)ly_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)ly_registedClassList;
//实例变量
+ (NSArray *)ly_instanceVariable;


- (BOOL)ly_hasPropertyForKey:(NSString*)key;
- (BOOL)ly_hasIvarForKey:(NSString*)key;

/**
 * 字典给模型赋值
 * 用字典给一个类里的属性赋值,如有值是类中不存在的,常规情况下程序会崩溃
 * 根据本类的属性有选择的拿字典中的key value，如果本类的属性包含字典的key,则把key的value赋值给这个属性
 */
-(void)ly_modelWithDictionary:(NSDictionary *)dict;


@end
