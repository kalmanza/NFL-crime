//
//  ViewController.h
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrimeListPresenter, NFLCrimeDisplayData;

@interface CrimeListViewController : UIViewController

@property (strong, nonatomic) CrimeListPresenter *presenter;
@property (strong, nonatomic) NSArray<NFLCrimeDisplayData *> *crimes;

- (void)reloadTableView;

@end

