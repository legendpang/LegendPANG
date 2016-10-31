//
//  TimerLabel.m
//  nsarrydelete
//
//  Created by Dalang on 16/4/24.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "TimerLabel.h"

@interface TimerLabel()
@property CGFloat YHeight;

@property (nonatomic,strong) NSString * timerCountStr;//用于显示的字符串
@property (nonatomic,strong) NSTimer * timerLabelCount;//定时器

@property (nonatomic,assign)int totalTime; //总的时间--单位为秒
@end



@implementation TimerLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    _YHeight = 100;
    _timerCountStr = @"00:00:00";//初始值
    self = [super initWithFrame:frame];
    if (self) {
        
        if (frame.size.height > _YHeight) {
            //self.frame  = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, _YHeight);
        }
        self.text = _timerCountStr;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
-(void)beginCount
{
    _timerLabelCount = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
    //NSLog(@"计时开始");
}
-(void)stopCount
{
    [_timerLabelCount invalidate];
     //NSLog(@"计时停止");
}
-(void)timeChange:(NSTimer *)timer
{
    
    NSTimeInterval totalTimes = _totalTime ++ ;
    
    int HH = (int)totalTimes / 3600;   //将总时间转为时
    int MM = (int)totalTimes / 60 %60;//将总时间转为分
    int SS = (int)totalTimes % 60;    //将总时间转为秒
    
    //拼接总时间
    _timerCountStr = [NSString stringWithFormat:@"%.2d:%.2d:%.2d",HH,MM,SS];
    self.text = _timerCountStr;

}

@end
