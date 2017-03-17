//
//  DayActivityViewModel.m
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "DayActivityViewModel.h"
#import "DayActivityCoreDataModel.h"
#import "Util.h"

@interface DayActivityViewModel ()

@property(strong, nonatomic) DayActivityCoreDataModel *model;

@end

@implementation DayActivityViewModel

- (instancetype)initWithModel:(DayActivityCoreDataModel *)model
{
    self = [super init];
    if (self) {
        _model = model;
        [self bindModel];
    }
    return self;
}

- (void)bindModel {
    
    self.totalStepsCount = self.model.walk + self.model.aerobicWalk + self.model.run;
    self.walkedSteps = self.model.walk;
    self.aerobicWalkedSteps = self.model.aerobicWalk;
    self.runSteps = self.model.run;
    
    NSString *unit = [Util wordDeclesionForCount:self.totalStepsCount andWords:@[@"шаг", @"шага", @"шагов"]];
    self.achievement = [NSString stringWithFormat:@"%ld %@", self.totalStepsCount, unit];
    
    NSString *strDate = [Util parseDate:self.model.date];
    self.activity = [@"Активность " stringByAppendingString: strDate];
}

@end
