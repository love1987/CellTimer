//
//  VC_GCDTimerViewController.m
//  Cell_Timer
//
//  Created by dcjt on 2018/12/18.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "VC_GCDTimerViewController.h"
#import "VC_TimerTableViewCell.h"
#import "GCDTimer.h"

@interface VC_GCDTimerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation VC_GCDTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableview registerNib:[UINib nibWithNibName:@"VC_TimerTableViewCell" bundle:nil] forCellReuseIdentifier:@"VC_TimerTableViewCell"];
    self.array = [NSMutableArray array];
    self.tableview.rowHeight = 60;
    for (int i=0; i<30; i++) {
        NSInteger temp = arc4random()%1000;
        [self.array addObject:[NSNumber numberWithInteger:temp]];
    }
    __weak typeof(self) weakSelf = self;
    self.timer = [GCDTimer scheduledTimerWithTimeInterval:1 queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) action:^{
        for (int i=0; i<weakSelf.array.count; i++) {
            NSNumber *temp = weakSelf.array[i];
            NSInteger tmp = temp.integerValue;
            tmp--;
            [weakSelf.array replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:tmp]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSArray *cells = weakSelf.tableview.visibleCells;
            for (VC_TimerTableViewCell *cell in cells) {
                NSNumber *temp = weakSelf.array[cell.tag];
                NSInteger tmp = temp.integerValue;
                [cell configureTimerWithTime:tmp];
            }
        });
    }];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VC_TimerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VC_TimerTableViewCell" forIndexPath:indexPath];
    NSNumber *number = self.array[indexPath.row];
    [cell configureTimerWithTime:number.integerValue];
    cell.tag = indexPath.row;
    return cell;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)dealloc{
    NSLog(@"%@---%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    NSLog(@"%s",__func__);
    NSLog(@"%s---%@",object_getClassName(self),NSStringFromSelector(_cmd));
    dispatch_source_cancel(self.timer);
    self.timer = nil;
}

@end
