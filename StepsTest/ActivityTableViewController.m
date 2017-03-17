//
//  ActivityTableViewController.m
//  StepsTest
//
//  Created by Александр Смоленский on 17.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "ActivityViewModel.h"
#import "DayActivityTableViewCell.h"
#import "DayActivityViewModel.h"
#import "Util.h"

@interface ActivityTableViewController ()

@property(strong, nonatomic)ActivityViewModel *viewModel;

@end

@implementation ActivityTableViewController

- (instancetype)initWithViewModel:(ActivityViewModel *)viewModel
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel.tableView = self.tableView;
    self.title = self.viewModel.title;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addActivityRecords)];
    self.navigationItem.rightBarButtonItem = addBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (void)addActivityRecords {
    [self.viewModel addNewActivityRecords];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DayActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DayActivityTableViewCell"];
    if (!cell) {
        cell = [[DayActivityTableViewCell alloc] init];
    }
    [cell bindViewModel:[self.viewModel cellViewModelForIndexPath:indexPath]];
    return cell;
    
}

#pragma mark - <UITableViewDelegate>

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return IPAD ? 90 : 50;
}

@end
