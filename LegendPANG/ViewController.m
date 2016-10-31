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
#pragma mark - Test TimerLabel
-(void)showTimerLabel{
    _timerLabel = [[TimerLabel alloc] initWithFrame:CGRectMake(100, 50, 100, 50)];
    _timerLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:_timerLabel];
    
    UIButton * beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    beginBtn.frame = CGRectMake(50, 200, 50, 20);
    [beginBtn addTarget:self action:@selector(beginCountClick:) forControlEvents:UIControlEventTouchUpInside];
    [beginBtn setTitle:@"begin" forState:UIControlStateNormal];
    beginBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:beginBtn];
    
    UIButton * stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    stopBtn.frame = CGRectMake(150, 200, 50, 20);
    [stopBtn addTarget:self action:@selector(stopCountClick:) forControlEvents:UIControlEventTouchUpInside];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    stopBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:stopBtn];

   
}
-(void)beginCountClick:(UIButton *)btn{
     [_timerLabel beginCount];
}
-(void)stopCountClick:(UIButton *)btn{
     [_timerLabel stopCount];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
