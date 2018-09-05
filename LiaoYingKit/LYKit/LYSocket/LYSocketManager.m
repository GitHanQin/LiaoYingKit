//
//  LYSocketManager.m
//  LYKitDemo
//
//  Created by 了赢 on 2018/4/12.
//  Copyright © 2018年 www.ly.LYKit. All rights reserved.
//

#import "LYSocketManager.h"

@interface LYSocketManager()<SRWebSocketDelegate>

@property (nonatomic,strong)SRWebSocket *webSocket;

@property (nonatomic,assign)LYSocketStatus LY_socketStatus;

@property (nonatomic,weak)NSTimer *timer;

@property (nonatomic,copy)NSString *urlString;


@end

@implementation LYSocketManager{
    NSInteger _reconnectCounter; //重新连接次数
}




#pragma mark——————————————直接用类名初始化
+ (void)LY_open:(NSString *)urlStr connect:(LYSocketDidConnectBlock)connect receive:(LYSocketDidReceiveBlock)receive failure:(LYSocketDidFailBlock)failure{
    
    [[LYSocketManager shareManager] LY_open:urlStr connect:connect receive:receive failure:failure];
    
}

#pragma mark——————————————发送消息
+ (void)LY_send:(id)data
{
    [[LYSocketManager shareManager] LY_send:data];
}

#pragma mark——————————————取消连接
+ (void)LY_close
{
    [[LYSocketManager shareManager] LY_close];
}


//单例
+ (instancetype)shareManager{
    static LYSocketManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.overtime = 1;
        instance.reconnectCount = 5;
    });
    return instance;
}


//初始化
- (void)LY_open:(NSString *)urlStr connect:(LYSocketDidConnectBlock)connect receive:(LYSocketDidReceiveBlock)receive failure:(LYSocketDidFailBlock)failure{
    self.connect = connect;
    self.receive = receive;
    self.failure = failure;
    [self LY_open:urlStr];
}

//设置url并开始连接
- (void)LY_open:(id)params{
    //    NSLog(@"params = %@",params);
    NSString *urlStr = nil;
    if ([params isKindOfClass:[NSString class]]) {
        urlStr = (NSString *)params;
    }
    else if([params isKindOfClass:[NSTimer class]]){
        NSTimer *timer = (NSTimer *)params;
        urlStr = [timer userInfo];
    }
    [LYSocketManager shareManager].urlString = urlStr;
    [self.webSocket close];
    self.webSocket.delegate = nil;
    
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    self.webSocket.delegate = self;
    
    [self.webSocket open];
}



//发送消息
- (void)LY_send:(id)data{
    switch (self.LY_socketStatus) {
        case LYSocketStatusConnected:
        case LYSocketStatusReceived:{
            NSLog(@"发送中。。。");
            [self.webSocket send:data];
            break;
        }
        case LYSocketStatusFailed:
            NSLog(@"发送失败");
            break;
        case LYSocketStatusClosedByServer:
            NSLog(@"已经关闭");
            break;
        case LYSocketStatusClosedByUser:
            NSLog(@"已经关闭");
            break;
    }
 
}


//重连
- (void)LY_reconnect{
    // 计数+1
    if (_reconnectCounter < self.reconnectCount - 1) {
        _reconnectCounter ++;
        // 开启定时器
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.overtime target:self selector:@selector(LY_open:) userInfo:self.urlString repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        self.timer = timer;
    }
    else{
    
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        return;
    }
    
}


//取消连接
- (void)LY_close:(LYSocketDidCloseBlock)close{
    [LYSocketManager shareManager].close = close;
    [self LY_close];
}
- (void)LY_close{
    
    [self.webSocket close];
    self.webSocket = nil;
    [self.timer invalidate];
    self.timer = nil;
}







#pragma mark -- SRWebSocketDelegate (执行代理)
- (void)webSocketDidOpen:(SRWebSocket *)webSocket{
    NSLog(@"Websocket Connected");
    
   self.connect ?self.connect() : nil;
   self.LY_socketStatus = LYSocketStatusConnected;
    // 开启成功后重置重连计数器
    _reconnectCounter = 0;
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
    NSLog(@":( Websocket Failed With Error %@", error);
    self.LY_socketStatus = LYSocketStatusFailed;
    self.failure ?self.failure(error) : nil;
    // 重连
    [self LY_reconnect];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message{
    NSLog(@":( Websocket Receive With message %@", message);
    self.LY_socketStatus = LYSocketStatusReceived;
    self.receive ? self.receive(message,LYSocketReceiveTypeForMessage) : nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
    NSLog(@"Closed Reason:%@  code = %zd",reason,code);
    if (reason) {
      self.LY_socketStatus = LYSocketStatusClosedByServer;
        // 重连
        [self LY_reconnect];
    }
    else{
       self.LY_socketStatus = LYSocketStatusClosedByUser;
    }
   self.close ? self.close(code,reason,wasClean) : nil;
    self.webSocket = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload{
    self.receive ?self.receive(pongPayload,LYSocketReceiveTypeForPong) : nil;
}

- (void)dealloc{
 
    [self LY_close];
}





@end
