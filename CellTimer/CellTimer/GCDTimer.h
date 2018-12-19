//
//  GCDTimer.h
//  OC-Swift
//
//  Created by ronglian on 2018/11/20.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCDTimer : NSObject

// 单例
+ (instancetype)sharedInstance;

/**
 启动一个timer (默认精度为0.1s)
 @param timerName       timer的名称，作为唯一标识。非空。
 @param interval        执行的时间间隔。
 @param queue           timer将被放入的队列。传入nil将自动放到一个全局子线程队列中。
 @param action          时间间隔到点时执行的block。
 */
- (void)scheduleGCDTimerWithName:(nonnull NSString *)timerName
                        interval:(double)interval
                           queue:(dispatch_queue_t)queue
                          action:(dispatch_block_t)action;

/**
 取消timer
 @param timerName timer的名称，作为唯一标识。
 */
- (void)cancelTimerWithName:(NSString *)timerName;

/**
 启动一个timer (默认精度为0.1s)
 @param interval        执行的时间间隔。
 @param queue           timer将被放入的队列。传入nil将自动放到一个全局子线程队列中。
 @param action          时间间隔到点时执行的block。
 */
+ (dispatch_source_t)scheduledTimerWithTimeInterval:(double)interval
                                              queue:(dispatch_queue_t)queue
                                             action:(dispatch_block_t)action;

@end

NS_ASSUME_NONNULL_END
