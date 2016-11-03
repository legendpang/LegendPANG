//
//  PBSlideView.h
//  LegendPANG
//
//  Created by Dalang on 2016/11/3.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define iViewWidth  [[UIScreen mainScreen] bounds].size.width
#define iViewHeight [[UIScreen mainScreen] bounds].size.height

@interface PBSlideView : UIView
-(instancetype)initWithUIViewControllerArray:(NSMutableArray *)ViewControllerArray;
@end
