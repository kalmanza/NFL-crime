//
//  CrimeListPresenter.h
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NFLCrimeListInteractor;

@interface CrimeListPresenter : NSObject

@property (strong, nonatomic) NFLCrimeListInteractor *crimeListInteractor;

- (void)updateCrimeList;

@end
