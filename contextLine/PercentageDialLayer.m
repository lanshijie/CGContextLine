//
//  PercentageDialLayer.m
//  CGContextLine
//
//  Created by lanshijie on 16/8/30.
//  Copyright © 2016年 LanSJ. All rights reserved.
//

#import "PercentageDialLayer.h"

@implementation PercentageDialLayer
- (id)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if (self)
    {
        if ([layer isKindOfClass:[PercentageDialLayer class]])
        {
            PercentageDialLayer *other = layer;
            self.total = other.total;
            self.color = other.color;
            self.completed = other.completed;
            self.completedColor = other.completedColor;
            
            self.radius = other.radius;
            self.innerRadius = other.innerRadius;
            
            self.startAngle = other.startAngle;
            self.endAngle = other.endAngle;
            self.shouldRasterize = YES;
        }
    }
    
    return self;
}

- (void)drawInContext:(CGContextRef)contextRef
{
    CGFloat originalRadius = _radius;
    CGFloat totalAngle = _endAngle - _startAngle;
    
    CGRect rect = self.bounds;
    
    CGFloat x0 = (rect.size.width - 2*_radius)/2.0 + _radius;
    CGFloat y0 = (rect.size.height - 2*_radius)/2.0 + _radius;
    CGContextSetFlatness(contextRef, 2.0);
    CGContextSetAllowsAntialiasing(contextRef, true);
    CGContextSetShouldAntialias(contextRef, true);
    CGContextSetInterpolationQuality(contextRef, kCGInterpolationHigh);
    
    CGContextSetLineWidth(contextRef,2.95f);
    
    for (int i = 0; i < _total + 1; i++) {
        CGContextMoveToPoint(contextRef, x0, y0);
        
        CGFloat x = x0 + cosf(_startAngle + totalAngle*i/_total)*_radius;
        CGFloat y = y0 + sinf(_startAngle + totalAngle*i/_total)*_radius;
        
        CGContextAddLineToPoint(contextRef, x, y);
        CGContextSetStrokeColorWithColor(contextRef, _color.CGColor);
        CGContextSetFillColorWithColor(contextRef, _color.CGColor);
        CGContextDrawPath(contextRef, kCGPathFillStroke);
    }
    
    for (int i = 0; i < _completed + 1; i++) {
        CGContextMoveToPoint(contextRef, x0, y0);
        _radius = originalRadius;
        CGFloat x = x0 + cosf(_startAngle + totalAngle*i/_total)*_radius;
        CGFloat y = y0+ sinf(_startAngle + totalAngle*i/_total)*_radius;
        CGContextAddLineToPoint(contextRef, x, y);
        CGContextSetStrokeColorWithColor(contextRef, _completedColor.CGColor);
        CGContextSetFillColorWithColor(contextRef, _completedColor.CGColor);
        CGContextDrawPath(contextRef, kCGPathFillStroke);
        if (i  == _completed) {
            _radius = originalRadius;
            break;
        }
    }
    
    CGContextAddArc(contextRef, x0, y0, _innerRadius, 0, 2*M_PI, 0);
    CGContextSetFillColorWithColor(contextRef, CGColorCreateCopy(self.backgroundColor));
    CGContextSetStrokeColorWithColor(contextRef, [UIColor clearColor].CGColor);
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}

+ (id)layer
{
    return [[PercentageDialLayer alloc] init];
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"completed"])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

@end
