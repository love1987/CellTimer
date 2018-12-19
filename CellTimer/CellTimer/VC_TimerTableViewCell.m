//
//  VC_TimerTableViewCell.m
//  Cell_Timer
//
//  Created by dcjt on 2018/12/18.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "VC_TimerTableViewCell.h"
#import "NSString+Date.h"

@interface VC_TimerTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation VC_TimerTableViewCell

- (void)configureTimerWithTime:(NSInteger)time {
    if (time<=0) {
        self.label.text = @"已结束";
        return;
    }
    self.label.text = [NSString lessSecondToDay:time];
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
}

@end
