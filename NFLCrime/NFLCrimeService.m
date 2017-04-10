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

@interface NFLCrimeService ()

@property (strong, nonatomic) NSDateFormatter *parameterDateFormatter;

@end

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

- (NSDateFormatter *)parameterDateFormatter
{
    if (_parameterDateFormatter) {
        return _parameterDateFormatter;
    }
    _parameterDateFormatter = [[NSDateFormatter alloc] init];
    [_parameterDateFormatter setDateFormat:@"yyyy-mm-dd"];
    return _parameterDateFormatter;
}

- (void)topCrimesFrom:(NSDate *)fromDate to:(NSDate *)toDate limit:(NSNumber *)limit offset:(NSNumber *)offset completion:(void (^)(NSArray *, NSError *))completion
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:4];
    NSString *fromParameter = [self parameterForDate:fromDate];
    if (fromParameter.length) {
        parameters[@"start_date"] = fromParameter;
    }
    NSString *toParameter = [self parameterForDate:toDate];
    if (toParameter.length) {
        parameters[@"end_date"] = toParameter;
    }
    if (limit) {
        parameters[@"limit"] = limit;
    }
    if (offset) {
        parameters[@"start_pos"] = offset;
    }
    [self.network GET:@"crime" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!completion) {
            return;
        }
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (!completion) {
            return;
        }
        completion(nil, error);
    }];
}

- (NSString *)parameterForDate:(NSDate *)date
{
    if (!date) {
        return nil;
    }
    NSString *parameter = [self.parameterDateFormatter stringFromDate:date];
    return parameter;
}

@end
