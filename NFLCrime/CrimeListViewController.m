//
//  ViewController.m
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import "CrimeListViewController.h"
#import "NFLCrimeService.h"
#import "CrimeListPresenter.h"

static NSString * const kCrimeListCellIdentifier = @"kCrimeListCellIdentifier";

@interface CrimeListViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CrimeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView:self.tableView];
    [self.presenter updateCrimeList];
}

- (void)configureTableView:(UITableView *)tableView
{
    [tableView setDataSource:self];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCrimeListCellIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadTableView
{
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.crimes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NFLCrimeDisplayData *displayData = self.crimes[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCrimeListCellIdentifier];
    return [self configureCell:cell withDisplayData:displayData];;
}

- (UITableViewCell *)configureCell:(UITableViewCell *)cell withDisplayData:(NFLCrimeDisplayData *)displayData
{
    [cell.textLabel setText:displayData.category];
    [cell.detailTextLabel setText:displayData.arrestCount];
    return cell;
}


@end
