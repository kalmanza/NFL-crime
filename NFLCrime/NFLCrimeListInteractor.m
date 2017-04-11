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

- (instancetype)initWithCrimeService:(NFLCrimeService *)service delegate:(id<NFLCrimeListInteractorDelegate>)delegate
{
    self = [super init];
    if (self) {
        _crimeService = service;
        _delegate = delegate;
    }
    return self;
}

- (void)getListOfCrimes
{
    [self.crimeService topCrimesFrom:nil to:nil limit:nil offset:nil completion:^(NSArray *crimes, NSError *error) {
        [self.delegate didGetListOfCrimes:[self arrayOfDisplayDataFromJSONArray:crimes]];
    }];
}

- (NSArray *)arrayOfDisplayDataFromJSONArray:(NSArray *)JSON
{
    NSMutableArray *displayArray = [[NSMutableArray alloc] initWithCapacity:JSON.count];
    for (NSDictionary *jsonDict in JSON) {
        [displayArray addObject:[self displayDataFromDictionary:jsonDict]];
    }
    return displayArray;
}

- (NFLCrimeDisplayData *)displayDataFromDictionary:(NSDictionary *)dict
{
    NFLCrimeDisplayData *data = [[NFLCrimeDisplayData alloc] init];
    data.category = dict[@"Category"];
    data.arrestCount = dict[@"arrest_count"];
    return data;
}

@end
