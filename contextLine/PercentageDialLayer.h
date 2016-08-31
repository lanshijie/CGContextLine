//
//  PercentageDialLayer.h
//  CGContextLine
//
//  Created by lanshijie on 16/8/30.
//  Copyright © 2016年 LanSJ. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface PercentageDialLayer : CALayer

@property (nonatomic,assign) int     total;
@property (nonatomic,assign) int     completed;
@property (nonatomic,strong) UIColor *color;
@property (nonatomic,strong) UIColor *completedColor;
@property (nonatomic,assign) CGFloat radius;
@property (nonatomic,assign) CGFloat innerRadius;
@property (nonatomic,assign) CGFloat startAngle;
@property (nonatomic,assign) CGFloat endAngle;
@property (nonatomic,assign) CFTimeInterval animationDuration;

@end
