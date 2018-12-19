//
//  GCDTimer.m
//  OC-Swift
//
//  Created by ronglian on 2018/11/20.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "GCDTimer.h"

@interface GCDTimer()

@property (nonatomic, strong) NSMutableDictionary *timerArry;

@end

@implementation GCDTimer

+ (instancetype)sharedInstance {
    static GCDTimer *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GCDTimer alloc] init];
    });
    return manager;
}

- (void)scheduleGCDTimerWithName:(nonnull NSString *)timerName interval:(double)interval queue:(dispatch_queue_t)queue action:(dispatch_block_t)action{
    if (queue == nil) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    [self cancelTimerWithName:timerName];
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    [self.timerArry setObject:timer forKey:timerName];
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), (uint64_t)(interval*NSEC_PER_SEC), 0);
    dispatch_source_set_event_handler(timer, ^{
        action();
    });
    dispatch_resume(timer);
}

- (void)cancelTimerWithName:(NSString *)timerName {
    dispatch_source_t timer = [self.timerArry objectForKey:timerName];
    if (!timer) {
        return;
    }
    [self.timerArry removeObjectForKey:timerName];
    dispatch_source_cancel(timer);
}

- (NSMutableDictionary*)timerArry {
    if (!_timerArry) {
        _timerArry = [[NSMutableDictionary alloc] init];
    }
    return _timerArry;
}

+ (dispatch_source_t)scheduledTimerWithTimeInterval:(double)interval
                                              queue:(dispatch_queue_t)queue
                                             action:(dispatch_block_t)action {
    if (queue == nil) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), (uint64_t)(interval*NSEC_PER_SEC), 0);
    dispatch_source_set_event_handler(timer, ^{
        action();
    });
    dispatch_resume(timer);
    return timer;
}

@end
