//
//  LYSocketManager.h
//  LYKitDemo
//
//  Created by 了赢 on 2018/4/12.
//  Copyright © 2018年 www.ly.LYKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SRWebSocket.h>

@interface LYSocketManager : NSObject



/**
 *  socket状态
 */
typedef NS_ENUM(NSInteger,LYSocketStatus){
    LYSocketStatusConnected,// 已连接
    LYSocketStatusFailed,// 失败
    LYSocketStatusClosedByServer,// 系统关闭
    LYSocketStatusClosedByUser,// 用户关闭
    LYSocketStatusReceived// 接收消息
};




/**
 *  消息类型
 */
typedef NS_ENUM(NSInteger,LYSocketReceiveType){
    LYSocketReceiveTypeForMessage,
    LYSocketReceiveTypeForPong
};


/**
 *  连接成功回调
 */
typedef void(^LYSocketDidConnectBlock)();


/**
 *  失败回调
 */
typedef void(^LYSocketDidFailBlock)(NSError *error);





/**
 *  关闭回调
 */
typedef void(^LYSocketDidCloseBlock)(NSInteger code,NSString *reason,BOOL wasClean);



/**
 *  消息接收回调
 */
typedef void(^LYSocketDidReceiveBlock)(id message ,LYSocketReceiveType type);




/**
 *  连接回调
 */
@property (nonatomic,copy)LYSocketDidConnectBlock connect;




/**
 *  接收消息回调
 */
@property (nonatomic,copy)LYSocketDidReceiveBlock receive;



/**
 *  失败回调
 */
@property (nonatomic,copy)LYSocketDidFailBlock failure;



/**
 *  关闭回调
 */
@property (nonatomic,copy)LYSocketDidCloseBlock close;




/**
 *  当前的socket状态
 */
@property (nonatomic,assign,readonly)LYSocketStatus LY_socketStatus;



/**
 *  超时重连时间，默认1秒
 */
@property (nonatomic,assign)NSTimeInterval overtime;



/**
 *  重连次数,默认5次
 */
@property (nonatomic, assign)NSUInteger reconnectCount;




#pragma mark——————————————直接用类名初始化
+ (void)LY_open:(NSString *)urlStr connect:(LYSocketDidConnectBlock)connect receive:(LYSocketDidReceiveBlock)receive failure:(LYSocketDidFailBlock)failure;


#pragma mark——————————————发送消息
+ (void)LY_send:(id)data;


#pragma mark——————————————取消连接
+ (void)LY_close;

@end
