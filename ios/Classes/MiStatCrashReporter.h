//
//  MiStatCrashReporter.h
//  MiStatSDK
//
//  Created by shen yang on 1/4/15.
//  Copyright (c) 2015 Xiaomi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiStatCrashReporter : NSObject


/**
 * 上传日志策略
 */
typedef enum {
    MI_STAT_CRASH_REPORTER_MODE_AUTO = 0,   // 自动模式:启动App, 有crash自动上报
    MI_STAT_CRASH_REPORTER_MODE_SYNC,       // 同步模式:sdk收集crash, 遵循统计上报时机
    MI_STAT_CRASH_REPORTER_MODE_MANUAL,     // 手动模式:sdk收集crash, 开发者处理上报时机    
} MI_STAT_CRASH_REPORTER_MODE;


/**
 * 开启Crash收集功能
 */
+ (void)enabledCrashReportWithMode:(MI_STAT_CRASH_REPORTER_MODE)mode;


/**
 * 手动模式下, 用来检查本地是否有CrashReport.
 */
+ (BOOL)hasPendingCrashReport;


/**
 * 手动模式下, 触发上报CrashReport, 
 * NOTE 成功后删除report
 */
+ (void)triggerUploadCrashReport;


@end
