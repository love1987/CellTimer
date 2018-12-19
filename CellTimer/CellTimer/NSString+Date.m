//
//  NSString+Date.m
//  Cell_Timer
//
//  Created by dcjt on 2018/12/18.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

//根据秒数计算剩余时间：小时，分钟，秒
+ (NSString*)lessSecondToDay:(NSUInteger)seconds
{
    NSUInteger hour = (NSUInteger)seconds/3600;
    NSUInteger min  = (NSUInteger)(seconds%(3600))/60;
    NSUInteger second = (NSUInteger)(seconds%60);
    if (seconds == 0) {
        return @"已结束";
    }else {
        return [NSString stringWithFormat:@"%02zd:%02zd:%02zd",(unsigned long)hour,(unsigned long)min,(unsigned long)second];
    }
}

@end
