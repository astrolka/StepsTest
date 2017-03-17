//
//  DayActivityTableViewCell.h
//  StepsTest
//
//  Created by Александр Смоленский on 17.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DayActivityViewModel;

@interface DayActivityTableViewCell : UITableViewCell

- (void)bindViewModel:(DayActivityViewModel *)viewModel;

@end
