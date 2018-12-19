//
//  VC_And_Cell_NSTimerViewController.m
//  Cell_Timer
//
//  Created by dcjt on 2018/12/18.
//  Copyright © 2018 ronglian. All rights reserved.
//

#import "VC_And_Cell_NSTimerViewController.h"
#import "VC_And_Cell_NSTimerTableViewCell.h"
#import "NSTimer+Block.h"

@interface VC_And_Cell_NSTimerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation VC_And_Cell_NSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableview registerNib:[UINib nibWithNibName:@"VC_And_Cell_NSTimerTableViewCell" bundle:nil] forCellReuseIdentifier:@"VC_And_Cell_NSTimerTableViewCell"];
    self.array = [NSMutableArray array];
    self.tableview.rowHeight = 60;
    for (int i=0; i<30; i++) {
        NSInteger temp = arc4random()%1000;
        [self.array addObject:[NSNumber numberWithInteger:temp]];
    }
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        for (int i=0; i<weakSelf.array.count; i++) {
            NSNumber *temp = weakSelf.array[i];
            NSInteger tmp = temp.integerValue;
            tmp--;
            [weakSelf.array replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:tmp]];
        }
    } repeats:YES];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VC_And_Cell_NSTimerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VC_And_Cell_NSTimerTableViewCell" forIndexPath:indexPath];
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
    [self.timer invalidate];
    self.timer = nil;
}

@end
