//
//  ProgressView.m
//  StepsTest
//
//  Created by Александр Смоленский on 17.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "ProgressView.h"
#import "DayActivityViewModel.h"
#import "Util.h"

typedef enum {
    Counterclockwise = 0,
    Clockwise
}Direction;

@interface ProgressView ()

@property(assign, nonatomic)CGFloat totalStepsCount;
@property(assign, nonatomic)CGFloat walkedSteps;
@property(assign, nonatomic)CGFloat aerobicWalkedSteps;
@property(assign, nonatomic)CGFloat runSteps;

@end

@implementation ProgressView


- (void)setViewModel:(DayActivityViewModel *)viewModel {
    _viewModel = viewModel;
    self.totalStepsCount = (CGFloat)viewModel.totalStepsCount;
    self.walkedSteps = (CGFloat)viewModel.walkedSteps;
    self.aerobicWalkedSteps = (CGFloat)viewModel.aerobicWalkedSteps;
    self.runSteps = (CGFloat)viewModel.runSteps;
    [self setNeedsLayout];
}

- (void)drawRect:(CGRect)rect {
    if (!self.viewModel) {
        return;
    }
    
    CGFloat lineWidth = CGRectGetHeight(rect);
    
    CGFloat interItemSpacing = lineWidth / 3;
    CGFloat walkLineWidth = CGRectGetWidth(rect) * self.walkedSteps / self.totalStepsCount - lineWidth / 2 - interItemSpacing / 2;
    CGFloat aerobicWalkLineWidth = CGRectGetWidth(rect) * self.aerobicWalkedSteps / self.totalStepsCount - lineWidth / 2 - interItemSpacing / 2;
    CGFloat runLineWidth = CGRectGetWidth(rect) * self.runSteps / self.totalStepsCount - lineWidth / 2 - interItemSpacing / 2;
    
    CGFloat xCoord = lineWidth / 2;
    CGFloat yCoord = lineWidth / 2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextSetStrokeColorWithColor(context, WALK_COLOR.CGColor);
    CGContextMoveToPoint(context, xCoord, yCoord);
    CGContextAddLineToPoint(context, xCoord += walkLineWidth, yCoord);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, AEROBIC_COLOR.CGColor);
    CGContextMoveToPoint(context, xCoord += interItemSpacing, yCoord);
    CGContextAddLineToPoint(context, xCoord += aerobicWalkLineWidth, yCoord);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, RUN_COLOR.CGColor);
    CGContextMoveToPoint(context, xCoord += interItemSpacing, yCoord);
    CGContextAddLineToPoint(context, xCoord += runLineWidth, yCoord);
    CGContextStrokePath(context);
    
    [self addLineRoundCappWithRadius:lineWidth / 2 center:CGPointMake(lineWidth / 2, yCoord) color:WALK_COLOR.CGColor andSide:Counterclockwise];
    [self addLineRoundCappWithRadius:lineWidth / 2 center:CGPointMake(xCoord, yCoord) color:RUN_COLOR.CGColor andSide:Clockwise];
    
}

- (void)addLineRoundCappWithRadius:(CGFloat)radius center:(CGPoint)center color:(CGColorRef)color andSide:(Direction)direction {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color);

    CGContextAddArc(context, center.x, center.y, radius, M_PI_2, -M_PI_2, direction);
    CGContextFillPath(context);
    
}

@end
