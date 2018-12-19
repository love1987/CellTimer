//
//  NSTimer+Block.m
//  Cell_Timer
//
//  Created by ronglian on 2018/11/30.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)

+ (void)ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(ExecBlock:) userInfo:[block copy] repeats:repeats];
}

@end
