//
//  PBChartLineView.m
//  LegendPANG
//
//  Created by Dalang on 2016/12/13.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "PBChartLineView.h"
#define margin      20
#define zzWidth     self.bounds.size.width
#define zzHeight    self.bounds.size.height

// 颜色RGB
#define zzColor(r, g, b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define zzColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define zzRandomColor  zzColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface PBChartLineView()
@property (nonatomic,assign)CGRect tempFrame;
@end


@implementation PBChartLineView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tempFrame = frame;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    NSArray * x_itemArr = @[@"北京", @"上海", @"广州", @"深圳", @"武汉", @"成都", @"南京"];
    NSArray * y_itemArr = @[@"80", @"70", @"90", @"60", @"40", @"30", @"60"];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //坐标轴原点
    CGPoint rPoint = CGPointMake(margin, _tempFrame.size.height-margin);
    
    //画y轴
    [path moveToPoint:rPoint];
    [path addLineToPoint:CGPointMake(margin, 0)];
    
    //画y轴的箭头
    [path moveToPoint:CGPointMake(margin, 0)];
    [path addLineToPoint:CGPointMake(margin-5, 5)];
    [path moveToPoint:CGPointMake(margin, 0)];
    [path addLineToPoint:CGPointMake(margin+5, 5)];
    
    //画x轴
    [path moveToPoint:rPoint];
    [path addLineToPoint:CGPointMake(_tempFrame.size.width-margin, _tempFrame.size.height-margin)];
    
    //画x轴的箭头
    [path moveToPoint:CGPointMake(_tempFrame.size.width-margin, _tempFrame.size.height-margin)];
    [path addLineToPoint:CGPointMake(_tempFrame.size.width-margin-5, _tempFrame.size.height-margin-5)];
    [path moveToPoint:CGPointMake(_tempFrame.size.width-margin, _tempFrame.size.height-margin)];
    [path addLineToPoint:CGPointMake(_tempFrame.size.width-margin-5, _tempFrame.size.height-margin+5)];
    
    //x轴的长度
    CGFloat xLength = _tempFrame.size.width-margin-margin;
    //y轴的长度
    CGFloat yLength = _tempFrame.size.height-margin;
    //计算x轴坐标的间隔
    CGFloat xSpace = xLength/x_itemArr.count;
    //计算y轴坐标的间隔
    CGFloat ySpace = yLength/y_itemArr.count;
    
    //画x轴上的标度
    for (int i=0; i<x_itemArr.count; i++) {
        
        [path moveToPoint:CGPointMake(margin+(i+1)*xSpace, _tempFrame.size.height-margin)];
        [path addLineToPoint:CGPointMake(margin+(i+1)*xSpace, _tempFrame.size.height-margin-3)];
    }
    
    //画y轴上的标度
    for (int i=0; i<y_itemArr.count; i++) {
        
        [path moveToPoint:CGPointMake(margin, _tempFrame.size.height-(margin+(i+1)*ySpace))];
        [path addLineToPoint:CGPointMake(margin+3, _tempFrame.size.height-(margin+(i+1)*ySpace))];
    }
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor blackColor].CGColor;
    //坐标轴线的颜色
    layer.strokeColor = [UIColor whiteColor].CGColor;
    //坐标轴线的宽度
    layer.lineWidth = 1;
    [self.layer addSublayer:layer];
    
    //给x轴加标注
    for (int i=0; i<x_itemArr.count; i++) {
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(margin+(i+1)*xSpace-10, _tempFrame.size.height-margin, 25, 20)];
        lab.text = x_itemArr[i];
        lab.textColor = [UIColor blackColor];
        lab.font = [UIFont boldSystemFontOfSize:10];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
    }
    
    //给y轴加标注
    for (int i=0; i<y_itemArr.count; i++) {
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(margin-25, _tempFrame.size.height-(margin+(i+1)*ySpace)-15, 25, 20)];
        lab.text = [NSString stringWithFormat:@"%d", 10*(i+1)];
        lab.textColor = [UIColor blackColor];
        lab.font = [UIFont boldSystemFontOfSize:12];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
    }
    
    /*******************************绘制折线*********************************/
    CGPoint startPoint = CGPointMake(margin, _tempFrame.size.height-(margin+([y_itemArr[0] doubleValue]/ySpace)*ySpace));
    CGPoint endPoint;
    
    for (int i=0; i<x_itemArr.count; i++) {
        
        endPoint = CGPointMake(margin+(i+1)*xSpace, _tempFrame.size.height-(margin+([y_itemArr[i] doubleValue]/ySpace)*ySpace));
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:startPoint];
        //绘制各个点
        [path addArcWithCenter:endPoint radius:1.5 startAngle:0 endAngle:2*M_PI clockwise:YES];
        [path addLineToPoint:endPoint];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.lineWidth = 1.0;
        [self.layer addSublayer:layer];
    
        startPoint = endPoint;
        
    }

    
}


@end
