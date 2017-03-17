//
//  DayActivityTableViewCell.m
//  StepsTest
//
//  Created by Александр Смоленский on 17.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "DayActivityTableViewCell.h"
#import "DayActivityViewModel.h"
#import "Util.h"
#import "ProgressView.h"
#import "SeparatorView.h"
#import "UIView+UpperSeparator.h"

typedef enum {
    Walk,
    AerobicWalk,
    Run
}ActivityType;

@interface DayActivityTableViewCell ()

@property(strong, nonatomic)DayActivityViewModel *viewModel;

@property(strong, nonatomic)UILabel *activityLabel;
@property(strong, nonatomic)UILabel *achievementLabel;
@property(strong, nonatomic)UILabel *walkActivityLabel;
@property(strong, nonatomic)UILabel *aerobicWalkActivityLabel;
@property(strong, nonatomic)UILabel *runActivityLabel;
@property(strong, nonatomic)ProgressView *progressView;



@end

@implementation DayActivityTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];        
    }
    return self;
}

- (void)bindViewModel:(DayActivityViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.activityLabel.text = viewModel.activity;
    self.achievementLabel.text = viewModel.achievement;
    self.walkActivityLabel.text = [NSString stringWithFormat:@"%ld", viewModel.walkedSteps];
    self.aerobicWalkActivityLabel.text = [NSString stringWithFormat:@"%ld", viewModel.aerobicWalkedSteps];
    self.runActivityLabel.text = [NSString stringWithFormat:@"%ld", viewModel.runSteps];
    self.progressView.viewModel = viewModel;
}

- (void)setupSubviews {
    
    //Setup upper two labels in a stack
    
    self.activityLabel = [[UILabel alloc] init];
    CGFloat topFontSize = IPAD ? 30 : 18;
    self.activityLabel.font = [UIFont systemFontOfSize:topFontSize];
    
    self.achievementLabel = [[UILabel alloc] init];
    self.achievementLabel.font = [UIFont boldSystemFontOfSize:topFontSize];
    
    UIStackView *topStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.activityLabel, self.achievementLabel]];
    topStack.distribution = UIStackViewDistributionEqualSpacing;
    topStack.alignment = UIStackViewAlignmentCenter;
    topStack.axis = UILayoutConstraintAxisHorizontal;
    [topStack setLayoutMarginsRelativeArrangement:YES];
    CGFloat margin = IPAD ? 28 : 15;
    topStack.layoutMargins = UIEdgeInsetsMake(margin, 0, margin, 0);
    
    //Setup progressView
    
    self.progressView = [[ProgressView alloc] init];
    self.progressView.backgroundColor = [UIColor whiteColor];
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.progressView addConstraint:[NSLayoutConstraint constraintWithItem:self.progressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:IPAD ? 7 : 4]];
    
    //Setup bottom counter labels
    
    UIStackView *walkStack          = [self stackViewForActivityType:Walk];
    walkStack.translatesAutoresizingMaskIntoConstraints = NO;
    UIStackView *aerobicWalkStack   = [self stackViewForActivityType:AerobicWalk];
    aerobicWalkStack.translatesAutoresizingMaskIntoConstraints = NO;
    UIStackView *runStack           = [self stackViewForActivityType:Run];
    runStack.translatesAutoresizingMaskIntoConstraints = NO;
    
    //Setup container for bottom counter labels
    
    UIView *bottomContainerView = [[UIView alloc] init];
    [bottomContainerView addSubview:walkStack];
    [bottomContainerView addSubview:aerobicWalkStack];
    [bottomContainerView addSubview:runStack];
    margin = IPAD ? 60 : 30;
    bottomContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [bottomContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[stack]-|" options:0 metrics:nil views:@{@"stack" : walkStack}]];
    [bottomContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[stack]" options:0 metrics:@{@"margin" : @(margin)} views:@{@"stack" : walkStack}]];
    [bottomContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[stack]-|" options:0 metrics:nil views:@{@"stack" : runStack}]];
    [bottomContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[stack]-(margin)-|" options:0 metrics:@{@"margin" : @(margin)} views:@{@"stack" : runStack}]];
    [bottomContainerView addConstraint:[NSLayoutConstraint constraintWithItem:aerobicWalkStack attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:bottomContainerView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [bottomContainerView addConstraint:[NSLayoutConstraint constraintWithItem:aerobicWalkStack attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:bottomContainerView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    //Setup cell separator view
    
    SeparatorView *separator = [[SeparatorView alloc] init];
    separator.translatesAutoresizingMaskIntoConstraints = NO;
    [separator addConstraint:[NSLayoutConstraint constraintWithItem:separator attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:IPAD ? 35 : 20]];
    [self addSubview:separator];
    
    //Setup all views in a stackView
    
    UIStackView *mainStack = [[UIStackView alloc] initWithArrangedSubviews:@[topStack, self.progressView, bottomContainerView]];
    mainStack.translatesAutoresizingMaskIntoConstraints = NO;
    mainStack.axis = UILayoutConstraintAxisVertical;
    [self addSubview:mainStack];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[stack][separator]|" options:0 metrics:nil views:@{@"stack" : mainStack, @"separator" : separator}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(spacing)-[stack]-(spacing)-|" options:0 metrics:@{@"spacing" : @(IPAD ? 30 : 15)} views:@{@"stack" : mainStack}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[separator]|" options:0 metrics:nil views:@{@"separator" : separator}]];
}

- (UIStackView *)stackViewForActivityType:(ActivityType)type {
    CGFloat titleFontSize = IPAD ? 26 : 14;
    CGFloat subtitleFontSize = IPAD ? 30 : 18;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
    
    UILabel *subtitleLabel = [[UILabel alloc] init];
    subtitleLabel.font = [UIFont boldSystemFontOfSize:subtitleFontSize];
    
    switch (type) {
        case Walk:
            self.walkActivityLabel = subtitleLabel;
            titleLabel.text = @"Ходьба";
            titleLabel.textColor = WALK_COLOR;
            break;
        case AerobicWalk:
            self.aerobicWalkActivityLabel = subtitleLabel;
            titleLabel.text = @"Аэробная ходьба";
            titleLabel.textColor = AEROBIC_COLOR;
            break;
        case Run:
            self.runActivityLabel = subtitleLabel;
            titleLabel.text = @"Бег";
            titleLabel.textColor = RUN_COLOR;
            break;
    }
    
    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, subtitleLabel]];
    stack.alignment = UIStackViewAlignmentCenter;
    stack.axis = UILayoutConstraintAxisVertical;
    return stack;
}

- (void)drawRect:(CGRect)rect {
    [self drawUpperStrokeSeparatorInRect:rect];
}

@end
