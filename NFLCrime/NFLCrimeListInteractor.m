//
//  NFLCrimeListInteractor.m
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import "NFLCrimeListInteractor.h"
#import "NFLCrimeService.h"

@implementation NFLCrimeListInteractor

- (void)getListOfCrimes
{
    [self.crimeService topCrimesFrom:nil to:nil limit:nil offset:nil completion:^(NSArray *crimes, NSError *error) {
        [self.delegate didGetListOfCrimes:crimes];
    }];
}

@end
