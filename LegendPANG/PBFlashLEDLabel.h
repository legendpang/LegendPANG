//
//  PBFlashLEDLabel.h
//  LegendPANG
//
//  Created by Dalang on 2016/11/18.
//  Copyright © 2016年 Dalang. All rights reserved.
//  简易让文字进行滚动效果

#import <UIKit/UIKit.h>

@interface PBFlashLEDLabel : UIView
/**
 color:这个参数的设置需要和该控件的SuperView的色值一样
 */
- (instancetype)initWithFrame:(CGRect)frame WithText:(NSString *)text  WithLabelBackgroudColor:(UIColor *)labelColor WithColor:(UIColor *)color;

@end
