//
//  ActivityTableViewController.h
//  StepsTest
//
//  Created by Александр Смоленский on 17.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActivityViewModel;

@interface ActivityTableViewController : UITableViewController

- (instancetype)initWithViewModel:(ActivityViewModel *)viewModel;

@end
