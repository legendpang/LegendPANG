//
//  ViewController.m
//  LegendPANG
//
//  Created by Dalang on 2016/10/31.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "ViewController.h"
#import "TimerLabel.h"
#import "PBRefreshAnimation.h"
#import "PBSlideView.h"
#import "PBFlashLEDLabel.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface ViewController ()
@property (nonatomic,strong)TimerLabel * timerLabel;
@property (nonatomic,strong)PBRefreshAnimation * refreshAnimation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    //[self showTimerLabel];
    //[self testPBRefshAnimation];
    //[self testPBSlideView];
    //[self testPBFlashLEDLabel];
    [self testSetLine];
}
#pragma mark- 画折线图
-(void)testSetLine{
    UIButton * testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(self.view.frame.size.width-100, 0, 100, 50);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn setTitle:@"折线图" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testSetLineClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];

}
-(void)testButton{
    UIButton * testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(self.view.frame.size.width-50, 0, 50, 50);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn setTitle:@"TEST" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}
-(void)testSetLineClick:(UIButton *)btn{
    FirstViewController * first = [[FirstViewController alloc] init];
    [self presentViewController:first animated:YES completion:^{
        
    }];
    
}
-(void)testClick:(UIButton *)btn{
    
}
#pragma mark - Test PBFlashLEDLabel
-(void)testPBFlashLEDLabel{
    PBFlashLEDLabel * flashLabel =[[PBFlashLEDLabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30) WithText:@"123456789" WithLabelBackgroudColor:[UIColor greenColor] WithColor:[UIColor cyanColor]];
    [self.view addSubview:flashLabel];
}
#pragma mark - Test PBSlideView
-(void)testPBSlideView{
    NSMutableArray * vcArr = [[NSMutableArray alloc] init];
    FirstViewController * first = [[FirstViewController alloc] init];
    [vcArr addObject:first];
    SecondViewController * second = [[SecondViewController alloc] init];
    [vcArr addObject:second];
    ThirdViewController * third = [[ThirdViewController alloc] init];
    [vcArr addObject:third];
    ThirdViewController * thirds = [[ThirdViewController alloc] init];
    [vcArr addObject:thirds];
    ThirdViewController * thirdss = [[ThirdViewController alloc] init];
    [vcArr addObject:thirdss];
    
    PBSlideView * slideView = [[PBSlideView alloc] initWithUIViewControllerArray:vcArr];
    slideView.frame = CGRectMake(0, 0, iViewWidth, iViewHeight);
    [self.view addSubview:slideView];
       
}
#pragma mark - Test PBRefreshAnimation
-(void)testPBRefshAnimation{
    
    NSMutableArray * imageArray = [[NSMutableArray alloc] init];
    for (int i = 1; i<19; i++) {
        [imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"DOVE%d.png",i]]];
    }
    
    [PBRefreshAnimation showImageAnimation:imageArray toView:self.view];
    [self testButton];

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
