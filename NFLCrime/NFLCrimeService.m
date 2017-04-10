//
//  NFLCrimeService.m
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import "NFLCrimeService.h"
#import <AFNetworking.h>

static NSString * const kBaseNFLCrimeURL = @"http://nflarrest.com/api/v1/";

@implementation NFLCrimeService

+ (instancetype)defaultService
{
    NSURL *baseURL = [NSURL URLWithString:kBaseNFLCrimeURL];
    AFHTTPSessionManager *network = [[AFHTTPSessionManager manager] initWithBaseURL:baseURL];
    return [[NFLCrimeService alloc] initWithNetwork:network];
}

- (instancetype)initWithNetwork:(AFHTTPSessionManager *)network
{
    self = [super init];
    if (self) {
        _network = network;
    }
    return self;
}

@end
