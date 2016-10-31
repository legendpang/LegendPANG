//
//  ViewController.m
//  LegendPANG
//
//  Created by Dalang on 2016/10/31.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "ViewController.h"
#import "TimerLabel.h"
@interface ViewController ()
@property (nonatomic,strong)TimerLabel * timerLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTimerLabel];
}
-(void)showTimerLabel{
    _timerLabel = [[TimerLabel alloc] initWithFrame:CGRectMake(100, 50, 100, 50)];
    _timerLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:_timerLabel];
    //[_timerLabel beginCount];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
