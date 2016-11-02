//
//  PBRefreshAnimation.h
//  nsarrydelete
//
//  Created by Dalang on 16/4/28.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBRefreshAnimation : UIView
//显示动画
+ (PBRefreshAnimation *)showImageAnimation:(NSMutableArray *)imageArray toView:(UIView *)view ;
//隐藏动画
+(void)hideAnimatingToView:(UIView *)view;
@end
