//
//  NFLCrimeListInteractor.h
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NFLCrimeService;

@protocol NFLCrimeListInteractorDelegate <NSObject>

- (void)didGetListOfCrimes:(NSArray *)crimes;

@end

@interface NFLCrimeListInteractor : NSObject

@property (strong, nonatomic) NFLCrimeService *crimeService;
@property (strong, nonatomic) id<NFLCrimeListInteractorDelegate> delegate;

- (void)getListOfCrimes;

@end
