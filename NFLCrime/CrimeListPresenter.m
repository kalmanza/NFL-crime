//
//  CrimeListPresenter.m
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import "CrimeListPresenter.h"
#import "NFLCrimeListInteractor.h"
#import "CrimeListViewController.h"

@interface CrimeListPresenter () 

@end

@implementation CrimeListPresenter

- (void)updateCrimeList
{
    [self.crimeListInteractor getListOfCrimes];
}

- (void)didGetListOfCrimes:(NSArray<NFLCrimeDisplayData *> *)crimes
{
    [self.crimeListController setCrimes:crimes];
    [self.crimeListController reloadTableView];
}

@end
