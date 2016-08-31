//
//  PercentageDialView.m
//  CGContextLine
//
//  Created by lanshijie on 16/8/30.
//  Copyright © 2016年 LanSJ. All rights reserved.
//

#import "PercentageDialView.h"
#import "PercentageDialLayer.h"

@implementation PercentageDialView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self _defaultInit];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self _defaultInit];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [self _defaultInit];
    }
    
    return self;
}

- (void)_defaultInit
{
    self.backgroundColor    = [UIColor purpleColor];
    self.opaque             = NO;
    self.total              = 100;
    self.completed          = 0;
    self.color              = [UIColor blackColor];
    self.completedColor     = [UIColor redColor];
    self.radius             = 30.0;
    self.innerRadius        = 20.0;
    self.startAngle         = 0;
    self.endAngle           = M_PI * 2;
}

+ (Class)layerClass
{
    return [PercentageDialLayer class];
}

- (void)setTotal:(int)total
{
    _total = total;
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.total = total;
    [layer setNeedsDisplay];
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.color = color;
    [layer setNeedsDisplay];
}

- (void)setCompletedColor:(UIColor *)completedColor
{
    _completedColor = completedColor;
    
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.completedColor = completedColor;
    [layer setNeedsDisplay];
}

-(void)setCompleted:(int)completed
{
    [self setCompleted:completed animated:NO];
}

- (void)setCompleted:(int)completed animated:(BOOL)animated
{
    if (completed == self.completed)
    {
        return;
    }
    
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    if (animated && self.animationDuration > 0.0f)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"completed"];
        animation.duration = self.animationDuration;
        animation.fromValue = [NSNumber numberWithFloat:self.completed];
        animation.toValue = [NSNumber numberWithFloat:completed];
        animation.delegate = self;
        [self.layer addAnimation:animation forKey:@"currentAnimation"];
    }
    
    layer.completed = completed;
    [layer setNeedsDisplay];
}


- (void)setRadius:(CGFloat)radius
{
    _radius = radius;
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.radius = radius;
    [layer setNeedsDisplay];
}

- (void)setInnerRadius:(CGFloat)innerRadius
{
    _innerRadius = innerRadius;
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.innerRadius = innerRadius;
    [layer setNeedsDisplay];
}

- (void)setStartAngle:(CGFloat)startAngle
{
    _startAngle = startAngle;
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.startAngle = startAngle;
    [layer setNeedsDisplay];
}

- (void)setEndAngle:(CGFloat)endAngle
{
    _endAngle = endAngle;
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.endAngle = endAngle;
    [layer setNeedsDisplay];
}

- (void)setAnimationDuration:(CFTimeInterval)animationDuration
{
    _animationDuration = animationDuration;
    PercentageDialLayer *layer = (PercentageDialLayer *)self.layer;
    layer.animationDuration = animationDuration;
    [layer setNeedsDisplay];
}

@end
