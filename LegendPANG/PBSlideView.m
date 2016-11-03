//
//  PBSlideView.m
//  LegendPANG
//
//  Created by Dalang on 2016/11/3.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "PBSlideView.h"
#define SlideButtonWidth 80


@interface PBSlideView()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView * topScrollView;
@property (nonatomic,strong)UIScrollView * showContentScrollView;
@property (nonatomic,strong)UILabel * selectLineLabel;//选中线
@property (nonatomic,assign)float space;//SlideButton之间的间隔
@end

@implementation PBSlideView

-(instancetype)initWithUIViewControllerArray:(NSMutableArray *)ViewControllerArray{
    self = [super init];
    if (self) {
        float buttonWidth = (SlideButtonWidth+5) * ViewControllerArray.count;
        if (buttonWidth > iViewWidth) {
            _space = 5;
        }else{
            _space = (iViewWidth-ViewControllerArray.count*SlideButtonWidth)/(ViewControllerArray.count+1);
        }
        _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, iViewWidth, 50)];
        _topScrollView.backgroundColor = [UIColor redColor];
        _topScrollView.tag = 1001;
        _topScrollView.delegate = self;
        _topScrollView.contentSize = CGSizeMake((80+_space)*ViewControllerArray.count, 0);
        [self addSubview:_topScrollView];
        
        
        if (buttonWidth > iViewWidth) {
            for (int i=0; i<ViewControllerArray.count; i++) {
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame =  CGRectMake(i*(80)+_space*i+_space, 10, 80, 30);
                btn.backgroundColor = [UIColor greenColor];
                btn.layer.cornerRadius = 10;
                btn.tag = 10+i;
                [btn addTarget:self action:@selector(SlideButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.layer.masksToBounds = YES;
                [_topScrollView addSubview:btn];
            }
        }else{
            for (int i=0; i<ViewControllerArray.count; i++) {
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame =  CGRectMake(i*(80)+_space*i+_space, 10, 80, 30);
                btn.backgroundColor = [UIColor greenColor];
                btn.layer.cornerRadius = 10;
                btn.layer.masksToBounds = YES;
                btn.tag = 10+i;
                [btn addTarget:self action:@selector(SlideButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                [_topScrollView addSubview:btn];
            }

        }
        
        
        //选中线
        _selectLineLabel = [[UILabel alloc] init];
        _selectLineLabel.frame = CGRectMake(_space, 48, 80, 2);
        _selectLineLabel.backgroundColor = [UIColor yellowColor];
        [_topScrollView addSubview:_selectLineLabel];
        
        _showContentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topScrollView.frame), iViewWidth, iViewHeight-CGRectGetMaxY(_topScrollView.frame))];
        _showContentScrollView.backgroundColor = [UIColor grayColor];
        _showContentScrollView.tag = 1002;
        _showContentScrollView.delegate = self;
        _showContentScrollView.contentSize = CGSizeMake(ViewControllerArray.count*iViewWidth, 0);
        _showContentScrollView.pagingEnabled = YES;
        _showContentScrollView.bounces = NO;
        [self addSubview:_showContentScrollView];
        
        for (int i=0; i<ViewControllerArray.count; i++) {
            UIViewController * VC = ViewControllerArray[i];
            VC.view.frame = CGRectMake(i*iViewWidth, 0, iViewWidth, iViewHeight);
            [_showContentScrollView addSubview:VC.view];
        }
        
        
    }
    return self;
}
-(void)SlideButtonClick:(UIButton *)btn{
    int index = (int)btn.tag-10;
    //改变偏移量
    _showContentScrollView.contentOffset = CGPointMake(index*iViewWidth, 0);
    //改变选中线的frame
    [UIView animateWithDuration:0.3 animations:^{
        _selectLineLabel.frame = CGRectMake(index*SlideButtonWidth+_space*index+_space, 48, SlideButtonWidth, 2);
    }];
    
    if (_selectLineLabel.frame.origin.x+80>iViewWidth) {
        [UIView animateWithDuration:0.5 animations:^{
            _topScrollView.contentOffset = CGPointMake(50, 0);
        }];
        
    }
    if (_selectLineLabel.frame.origin.x == _space) {
        [UIView animateWithDuration:0.5 animations:^{
            _topScrollView.contentOffset = CGPointMake(0, 0);
        }];
    }


}
#pragma mark -UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag==1002) {
        NSLog(@"%f",scrollView.contentOffset.x/iViewWidth);
        int index  = (int)scrollView.contentOffset.x/iViewWidth;
        //改变选中线的frame
        [UIView animateWithDuration:0.3 animations:^{
          _selectLineLabel.frame = CGRectMake(index*SlideButtonWidth+_space*index+_space, 48, SlideButtonWidth, 2);
        }];
        
        if (_selectLineLabel.frame.origin.x+80>iViewWidth) {
            [UIView animateWithDuration:0.5 animations:^{
                _topScrollView.contentOffset = CGPointMake(50, 0);
            }];
            
        }
        if (_selectLineLabel.frame.origin.x == _space) {
            [UIView animateWithDuration:0.5 animations:^{
                _topScrollView.contentOffset = CGPointMake(0, 0);
            }];
        }
    
    }
    if (scrollView.tag==1001) {
        NSLog(@"----%f",scrollView.contentOffset.x);
    }
}
@end
