//
//  CrimeListPresenter.h
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFLCrimeListInteractor.h"

@class NFLCrimeListInteractor, CrimeListViewController;

@interface CrimeListPresenter : NSObject <NFLCrimeListInteractorDelegate>

@property (weak, nonatomic) CrimeListViewController *crimeListController;
@property (strong, nonatomic) NFLCrimeListInteractor *crimeListInteractor;

- (void)updateCrimeList;

@end
