//
//  MiStatNetwork.h
//  MiStatSDK
//
//  Created by shen yang on 1/29/15.
//  Copyright (c) 2015 Xiaomi. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol MiAAnalyticsNetworkDelegate <NSObject>
@optional

/**
 * 可以根据你的需求 定制统计url的内容. 或则对此次请求忽略.
 * @return 为上报统计的值, nil为忽略.
 */
- (NSString*)mistatAnalyticsNetwork:(NSString*)url;
@end


@interface MiStatNetwork : NSObject

/**
 * 自动网络请求统计, 包括URL, 请求时长.
 */
+ (void)enableAnalyticsNetwork:(id<MiAAnalyticsNetworkDelegate>)delegate __deprecated;

/**
 * 自动网络请求统计, 包括URL, 请求时长.
 * 注意：网络统计默认为启动模式, 无须在调用.
 * 当关闭时enable=NO
 */
+ (void)enableAnalyticsNetwork:(BOOL)enable
                      delegate:(id<MiAAnalyticsNetworkDelegate>)delegate;


@end
