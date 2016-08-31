//
//  ViewController.m
//  CGContextLine
//
//  Created by lanshijie on 16/8/30.
//  Copyright © 2016年 LanSJ. All rights reserved.
//

#import "ViewController.h"
#import "PercentageDialView.h"

#define Screen_Bounds [UIScreen mainScreen].bounds
#define SCREEN_HEIGHT Screen_Bounds.size.height
#define SCREEN_WIDTH  Screen_Bounds.size.width

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel * _label;
    PercentageDialView * percentageDialView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    percentageDialView = [[PercentageDialView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    percentageDialView.backgroundColor = [UIColor greenColor];
    percentageDialView.total = 51;
    percentageDialView.color = [UIColor lightGrayColor];
    percentageDialView.completedColor = [UIColor blackColor];
    percentageDialView.radius = SCREEN_WIDTH / 2 - 50;
    percentageDialView.innerRadius = percentageDialView.radius -15;
    percentageDialView.startAngle = M_PI * 0.8;
    percentageDialView.endAngle = 2.2 * M_PI;
    percentageDialView.animationDuration = 2.0;
    percentageDialView.layer.shouldRasterize = YES;
    [self.view addSubview:percentageDialView];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _label.center = percentageDialView.center;
    [self.view addSubview:_label];
    _label.textAlignment = NSTextAlignmentCenter;
    float num = (arc4random() % 99) / 100.0;
    _label.text = [NSString stringWithFormat:@"%.f%%",num*100];
    _label.font = [UIFont systemFontOfSize:40];
    
    [percentageDialView setCompleted: num *percentageDialView.total animated:YES];

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT - 100, 100, 100);
    [self.view addSubview:btn];
    [btn setTitle:@"点击测试" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];

}
- (void)action:(UIButton * )btn{
    float num = (arc4random() % 99) / 100.0;
    _label.text = [NSString stringWithFormat:@"%.f%%",num*100];
    [percentageDialView setCompleted: num *percentageDialView.total animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
