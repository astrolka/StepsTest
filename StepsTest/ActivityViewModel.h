//
//  ActivityViewModel.h
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UITableView, DayActivityViewModel;

@interface ActivityViewModel : NSObject

@property(strong, nonatomic)NSString *title;
@property(weak, nonatomic)UITableView *tableView;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (DayActivityViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;
- (void)addNewActivityRecords;
@end
