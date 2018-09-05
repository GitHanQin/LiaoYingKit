//
//  NSObject+LYRuntime.h
//  LYKitDemo
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface NSObject (LYRuntime)

/** 属性列表 */
- (NSArray *)ly_propertiesInfo;
+ (NSArray *)ly_propertiesInfo;
/** 格式化之后的属性列表 */
+ (NSArray *)ly_propertiesWithCodeFormat;


/** 成员变量列表 */
- (NSArray *)ly_ivarInfo;
+ (NSArray *)ly_ivarInfo;


/** 对象方法列表 */
-(NSArray*)ly_instanceMethodList;
+(NSArray*)ly_instanceMethodList;
/** 类方法列表 */
+(NSArray*)ly_classMethodList;


/** 协议列表 */
-(NSDictionary *)ly_protocolList;
+(NSDictionary *)ly_protocolList;


/** 交换实例方法 */
+ (void)ly_SwizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
/** 交换类方法 */
+ (void)ly_SwizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;


/** 添加方法 */
+ (void)ly_addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;


@end
