//
//  ViewController.m
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import "ViewController.h"
#import "NFLCrimeService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NFLCrimeService defaultService] topCrimesFrom:nil to:nil limit:nil offset:nil completion:^(NSArray *crimes, NSError *error) {
        NSLog(@"%@", crimes);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
