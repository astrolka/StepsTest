//
//  DayActivityCoreDataModel.h
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface DayActivityCoreDataModel : NSManagedObject

@property(strong, nonatomic)NSDate *date;
@property(assign, nonatomic)NSInteger walk;
@property(assign, nonatomic)NSInteger aerobicWalk;
@property(assign, nonatomic)NSInteger run;

@end
