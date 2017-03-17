//
//  DayActivityViewModel.h
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DayActivityCoreDataModel;

@interface DayActivityViewModel : NSObject

- (instancetype)initWithModel:(DayActivityCoreDataModel *)model;

@property(strong, nonatomic)NSString *activity;
@property(strong, nonatomic)NSString *achievement;

@property(assign, nonatomic)NSInteger totalStepsCount;
@property(assign, nonatomic)NSInteger walkedSteps;
@property(assign, nonatomic)NSInteger aerobicWalkedSteps;
@property(assign, nonatomic)NSInteger runSteps;

@end
