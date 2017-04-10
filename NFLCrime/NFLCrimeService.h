//
//  NFLCrimeService.h
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface NFLCrimeService : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *network;

+ (instancetype)defaultService;

- (instancetype)initWithNetwork:(AFHTTPSessionManager *)network;

@end
