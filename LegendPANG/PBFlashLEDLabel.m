//
//  PBFlashLEDLabel.m
//  LegendPANG
//
//  Created by Dalang on 2016/11/18.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "PBFlashLEDLabel.h"

@interface PBFlashLEDLabel()
@property (nonatomic,strong)UILabel * coreLabel;
@property (nonatomic,strong)UILabel * secondCoreLabel;
@property (nonatomic,assign)CGRect defaultFrame;
@end

@implementation PBFlashLEDLabel

- (instancetype)initWithFrame:(CGRect)frame WithText:(NSString *)text  WithLabelBackgroudColor:(UIColor *)labelColor WithColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        self.backgroundColor = [UIColor clearColor];
        _defaultFrame = frame;
        
        UILabel * label = [[UILabel alloc] init];
        label.frame = frame;
        label.backgroundColor = labelColor;
        [self addSubview:label];
        
        _coreLabel = [[UILabel alloc] init];
        _coreLabel.frame = frame;
        _coreLabel.backgroundColor = [UIColor clearColor];
        _coreLabel.text = text;
        [self addSubview:_coreLabel];
        
        _secondCoreLabel = [[UILabel alloc] init];
        _secondCoreLabel.frame = CGRectMake(frame.origin.x+frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
        _secondCoreLabel.backgroundColor = [UIColor clearColor];
        _secondCoreLabel.text = text;
        [self addSubview:_secondCoreLabel];
        
        UIView * colver = [[UIView alloc] init];
        colver.frame = CGRectMake(frame.origin.x-frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
        colver.backgroundColor = color;
        [self addSubview:colver];
        
        UIView * colver1 = [[UIView alloc] init];
        colver1.frame = CGRectMake(frame.origin.x+frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
        colver1.backgroundColor = color;
        [self addSubview:colver1];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(labelRun) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)labelRun{
    if (_coreLabel.frame.origin.x == (_defaultFrame.origin.x-_defaultFrame.size.width)) {
        _coreLabel.frame = _defaultFrame;
    }
    if (_secondCoreLabel.frame.origin.x == _defaultFrame.origin.x) {
        _secondCoreLabel.frame = CGRectMake(_defaultFrame.origin.x+_defaultFrame.size.width, _defaultFrame.origin.y, _defaultFrame.size.width, _defaultFrame.size.height);
    }
    _coreLabel.frame = CGRectMake(_coreLabel.frame.origin.x-1, _coreLabel.frame.origin.y, _defaultFrame.size.width, _defaultFrame.size.height);
    _secondCoreLabel.frame = CGRectMake(_secondCoreLabel.frame.origin.x-1, _secondCoreLabel.frame.origin.y, _defaultFrame.size.width, _defaultFrame.size.height);
}
@end
