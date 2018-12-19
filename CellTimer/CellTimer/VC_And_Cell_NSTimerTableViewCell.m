//
//  VC_And_Cell_NSTimerTableViewCell.m
//  Cell_Timer
//
//  Created by dcjt on 2018/12/18.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "VC_And_Cell_NSTimerTableViewCell.h"
#import "NSString+Date.h"
#import "NSTimer+Block.h"

@interface VC_And_Cell_NSTimerTableViewCell()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger time;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation VC_And_Cell_NSTimerTableViewCell

- (void)configureTimerWithTime:(NSInteger)time {
    _time = time;
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    if (_time<=0) {
        self.label.text = @"已结束";
        return;
    }
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        if (weakSelf.time<=0) {
            weakSelf.label.text = @"已结束";
            [weakSelf.timer invalidate];
            weakSelf.timer = nil;
            return;
        }
        weakSelf.label.text = [NSString lessSecondToDay:weakSelf.time];;
        weakSelf.time--;
    } repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
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
    [self.timer invalidate];
    self.timer = nil;
}

@end
