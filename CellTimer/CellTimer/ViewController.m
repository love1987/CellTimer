//
//  ViewController.m
//  CellTimer
//
//  Created by dcjt on 2018/12/19.
//  Copyright © 2018 dcjt. All rights reserved.
//

#import "ViewController.h"
#import "VC_NSTimerViewController.h"
#import "VC_And_Cell_NSTimerViewController.h"
#import "VC_GCDTimerViewController.h"
#import "VC_And_Cell_GCDTimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)vc_NSTimerAction:(UIButton *)sender {
    VC_NSTimerViewController *timer = [[VC_NSTimerViewController alloc] initWithNibName:@"VC_NSTimerViewController" bundle:nil];
    [self.navigationController pushViewController:timer animated:YES];
}

- (IBAction)both_NSTimerAction:(UIButton *)sender {
    VC_And_Cell_NSTimerViewController *timer = [[VC_And_Cell_NSTimerViewController alloc] initWithNibName:@"VC_And_Cell_NSTimerViewController" bundle:nil];
    [self.navigationController pushViewController:timer animated:YES];
}

- (IBAction)vc_GCDTimerAction:(UIButton *)sender {
    VC_GCDTimerViewController *gcd =[[VC_GCDTimerViewController alloc] initWithNibName:@"VC_GCDTimerViewController" bundle:nil];
    [self.navigationController pushViewController:gcd animated:YES];
}

- (IBAction)both_GCDTimerAction:(UIButton *)sender {
    VC_And_Cell_GCDTimerViewController *gcd = [[VC_And_Cell_GCDTimerViewController alloc] initWithNibName:@"VC_And_Cell_GCDTimerViewController" bundle:nil];
    [self.navigationController pushViewController:gcd animated:YES];
}

@end
