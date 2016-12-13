//
//  FirstViewController.m
//  LegendPANG
//
//  Created by Dalang on 2016/11/3.
//  Copyright © 2016年 Dalang. All rights reserved.
//

#import "FirstViewController.h"
#import "PBChartLineView.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    PBChartLineView * pblineView = [[PBChartLineView alloc] initWithFrame:CGRectMake(40, 200, 300, 200)];
    pblineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pblineView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   [self dismissViewControllerAnimated:YES completion:^{
       
   }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
