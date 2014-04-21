//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Rahim Sonawalla on 4/18/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y  + bounds.size.height / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0
                      endAngle:M_PI * 2
                     clockwise:true];
    }
    
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
    
    CGRect imageRect = CGRectMake(bounds.size.width / 4.0, bounds.size.height / 4.0, bounds.size.width / 2.0, bounds.size.height / 2.0);
    
    CGContextSaveGState(currentContext);
    
    UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
    [trianglePath moveToPoint:CGPointMake(center.x, imageRect.origin.y)];
    [trianglePath addLineToPoint:CGPointMake(imageRect.origin.x, imageRect.origin.y + imageRect.size.height)];
    [trianglePath addLineToPoint:CGPointMake(imageRect.origin.x + imageRect.size.width, imageRect.origin.y + imageRect.size.height)];
    [trianglePath closePath];
    
    [trianglePath addClip];
    
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {0.0, 1.0, 0.0, 1.0,
                             1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(center.x, imageRect.origin.y);
    CGPoint endPoint = CGPointMake(center.x, imageRect.origin.y + imageRect.size.height);
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGContextRestoreGState(currentContext);
    
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:imageRect];
    CGContextRestoreGState(currentContext);
}

@end
