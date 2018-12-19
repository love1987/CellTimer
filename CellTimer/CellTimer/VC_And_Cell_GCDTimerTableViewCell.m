//
//  VC_And_Cell_GCDTimerTableViewCell.m
//  Cell_Timer
//
//  Created by dcjt on 2018/12/18.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "VC_And_Cell_GCDTimerTableViewCell.h"
#import "GCDTimer.h"
#import "NSString+Date.h"

@interface VC_And_Cell_GCDTimerTableViewCell()

@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, assign) NSInteger time;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation VC_And_Cell_GCDTimerTableViewCell

- (void)configureTimerWithTime:(NSInteger)time {
    _time = time;
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
    if (_time<=0) {
        self.label.text = @"已结束";
        return;
    }
    __weak typeof(self) weakSelf = self;
    self.timer = [GCDTimer scheduledTimerWithTimeInterval:1 queue:dispatch_get_main_queue() action:^{
        if (weakSelf.time<=0) {
            weakSelf.label.text = @"已结束";
            dispatch_source_cancel(weakSelf.timer);
            weakSelf.timer = nil;
            return;
        }
        weakSelf.label.text = [NSString lessSecondToDay:weakSelf.time];
        weakSelf.time--;
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc {
    NSLog(@"%@---%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    NSLog(@"%s",__func__);
    NSLog(@"%s---%@",object_getClassName(self),NSStringFromSelector(_cmd));
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

@end
