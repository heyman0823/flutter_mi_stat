//
//  MiStatSDK.h
//  MiStatSDK
//
//  Created by shen yang on 14-5-12.
//  Copyright (c) 2014年 Xiaomi. All rights reserved.
//
// verion:
// 140902 统计第一版. 打点支持5种模式.
// 加入多维分析参数
// 加入crash收集, 网络请求统计.
#import <Foundation/Foundation.h>

@interface MiStatSDK : NSObject

/**
 * 上传日志策略
 */
typedef enum {
    UPLOAD_POLICY_TYPE_LAUNCH = 0,             // 启动时发送
    UPLOAD_POLICY_TYPE_REALTIME,               // 实时发送
    UPLOAD_POLICY_TYPE_WIFI_ONLY,              // 只在wifi下, 时时
    UPLOAD_POLICY_TYPE_INTERVAL,               // 间隔时间
    UPLOAD_POLICY_TYPE_DEVELOPMENT,            // 开发者模式
} UPLOAD_POLICY;


/**
 * 注册统计SDK
 *
 * @param
 *     channel: App的渠道信息，便于后台可按照渠道来统计应用的各项数据
 */
+ (void)registerMiStat:(NSString*)channel;


/**
 * 设置上传策略
 *
 * @param
 *     policy: 发送策略
 *     interval: 当UPLOAD_POLICY_TYPE_INTERVAL时有效。单位:分钟
 */
+ (void)setUploadPolicy:(UPLOAD_POLICY)policy interval:(int)interval;


/**
 * 手动触发上报，该调用仅会在当上报策略设置为UPLOAD_POLICY_DEVELOPMENT时起作用。
 */
+ (void)triggerUploadManually;


/**
 * 记录界面进入事件，
 * 建议放在UIViewController 的- (void)viewDidAppear:(BOOL)animated方法中调用。
 *
 * @param
 *     name: 自定义窗口的名称
 */
+ (void)recordPage:(NSString*)name;


/**
 * 自定义打点: 字符串类型
 *
 * @param
 *     key: 事件的主键，是这个自定义事件的唯一标识。
 *     value: 事件的值，是一个字符串类型。
 */
+ (void)recordPropertyEvent:(NSString*)category key:(NSString*)key string:(NSString*)string;


/**
 * 自定义打点: 数字类型
 *
 * @param
 *     key: 事件的主键，是这个自定义事件的唯一标识。
 *     value: 事件的值，是一个long型的整数。
 */
+ (void)recordPropertyEvent:(NSString*)category key:(NSString*)key numeric:(long)numeric;


/**
 * 记录自定义计算事件
 *
 * @param
 *     key: 事件的主键，是这个自定义事件的唯一标识。
 *     value: 事件的值，是一个long型的整数。
 *     dictionary: 方便对事件进行更多维度的分析。
 */
+ (void)recordCalculateEvent:(NSString*)category key:(NSString*)key value:(long)value;
+ (void)recordCalculateEvent:(NSString*)category key:(NSString*)key value:(long)value dictionary:(NSDictionary*)dictionary;


/**
 * 记录自定义计数事件
 *
 * @param
 *     key: 事件的主键，是这个自定义事件的唯一标识。
 *     dictionary: 方便对事件进行更多维度的分析。
 */
+ (void)recordCountEvent:(NSString*)category key:(NSString*)key;
+ (void)recordCountEvent:(NSString*)category key:(NSString*)key dictionary:(NSDictionary*)dictionary;


/**
 * 获得设备标示
 * 当你在连调SDK的时候, 可以通过此方法注册设备.
 */
+ (NSString*)getDeviceID;

/**
 * SDK版本号
 */
+ (NSString*)getSDKVersion;

@end
