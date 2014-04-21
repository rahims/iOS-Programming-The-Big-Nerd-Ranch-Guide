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
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect bounds = self.bounds;
    
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
    [logoImage drawInRect:imageRect];
}

@end
