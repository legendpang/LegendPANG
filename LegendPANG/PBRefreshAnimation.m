//
//  PBRefreshAnimation.m
//  nsarrydelete
//
//  Created by Dalang on 16/4/28.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "PBRefreshAnimation.h"

@interface PBRefreshAnimation()

@property (nonatomic,strong)UIView * shadowView;

@end


@implementation PBRefreshAnimation


- (instancetype)initWithFrame:(CGRect)frame WithImageArray:(NSMutableArray *)imageArray;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //设置控件位置始终在屏幕中央
        [self setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2)];
        
        self.backgroundColor = [UIColor colorWithRed:19/225.0 green:19/225.0 blue:19/225.0 alpha:1.0];
        //设置控件边缘角度
        self.layer.cornerRadius = 10.0;
        
        //阴影的透明度
        //self.layer.shadowOpacity = 1;
        //阴影的偏移量
        //self.layer.shadowOffset = CGSizeMake(50, 50);
        //阴影角度 虚化效果
        //self.layer.shadowRadius = 10;
        //阴影的颜色:shadowColor
        //self.layer.shadowColor = [UIColor blueColor].CGColor;
        //self.layer.shadowPath =[UIBezierPath bezierPathWithRect:self.layer.bounds].CGPath;
        
        UIImageView * imageViewAnimation = [[UIImageView alloc] init];
        [imageViewAnimation setFrame:CGRectMake(0, 0, frame.size.width-10, frame.size.height -10)];
        [imageViewAnimation setCenter:CGPointMake(frame.size.width/2, frame.size.height/2)];
        imageViewAnimation.backgroundColor = [UIColor clearColor];
        
        //动画数组
        imageViewAnimation.animationImages = imageArray;
        //动画时间：数组里面所有的图片转一圈所用时间
        imageViewAnimation.animationDuration = 1;
        //循环次数：大于0的数：写几就循环几次，结束    0:无限循环
        imageViewAnimation.animationRepeatCount = 0;
        
        [self addSubview:imageViewAnimation];
        
        //开始动画
        [imageViewAnimation startAnimating];
        
    }
    return self;
}

@end
