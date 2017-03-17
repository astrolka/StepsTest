//
//  UIView+UpperSeparator.m
//  StepsTest
//
//  Created by Александр Смоленский on 17.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "UIView+UpperSeparator.h"
#import "Util.h"

@implementation UIView (UpperSeparator)

- (void)drawUpperStrokeSeparatorInRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat lineWidth = 1.f / [UIScreen mainScreen].scale;
    
    CGContextSetStrokeColorWithColor(context, SEPARATOR_STROKE_COLOR.CGColor);
    
    CGContextMoveToPoint(context, 0, lineWidth);
    CGContextAddLineToPoint(context, CGRectGetWidth(rect), lineWidth);
    
    CGContextStrokePath(context);
}

@end
