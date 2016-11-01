//
//  PBRefreshAnimation.m
//  nsarrydelete
//
//  Created by Dalang on 16/4/28.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "PBRefreshAnimation.h"

@interface PBRefreshAnimation()
@property (nonatomic,strong)UIImageView * imageViewAnimation;
@end


@implementation PBRefreshAnimation


- (instancetype)initWithImageArray:(NSMutableArray *)imageArray WithView:(UIView *)view;
{
    self = [super init];
    if (self) {
        UIView * backGroupView = [[UIView alloc] init];
        backGroupView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        backGroupView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];;
        [self addSubview:backGroupView];
        
        //设置控件位置
        [self setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        
        self.backgroundColor = [UIColor colorWithRed:19/225.0 green:19/225.0 blue:19/225.0 alpha:1.0];
        
        //设置控件边缘角度
        //self.layer.cornerRadius = 10.0;
        //阴影的透明度
        //self.layer.shadowOpacity = 1;
        //阴影的偏移量
        //self.layer.shadowOffset = CGSizeMake(50, 50);
        //阴影角度 虚化效果
        //self.layer.shadowRadius = 10;
        //阴影的颜色:shadowColor
        //self.layer.shadowColor = [UIColor blueColor].CGColor;
        //self.layer.shadowPath =[UIBezierPath bezierPathWithRect:self.layer.bounds].CGPath;
        
        _imageViewAnimation = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        _imageViewAnimation.backgroundColor = [UIColor colorWithRed:19/225.0 green:19/225.0 blue:19/225.0 alpha:1.0];
        [_imageViewAnimation setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2)];
        _imageViewAnimation.layer.cornerRadius = 9;
        _imageViewAnimation.layer.masksToBounds = YES;
        
        //动画数组
        _imageViewAnimation.animationImages = imageArray;
        //动画时间：数组里面所有的图片转一圈所用时间
        _imageViewAnimation.animationDuration = 1;
        //循环次数：大于0的数：写几就循环几次，结束    0:无限循环
        _imageViewAnimation.animationRepeatCount = 0;
        
        [self addSubview:_imageViewAnimation];
        
        //开始动画
        [_imageViewAnimation startAnimating];
        [view addSubview:self];
    }
    return self;
}
+ (PBRefreshAnimation *)showImageAnimation:(NSMutableArray *)imageArray toView:(UIView *)view {
     if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    PBRefreshAnimation * pbra = [[self alloc] initWithImageArray:imageArray WithView:view];
    return pbra;
}
-(void)hideAnimating{
    [self removeFromSuperview];
}
@end
