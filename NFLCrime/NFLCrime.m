//
//  NFLCrime.m
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import "NFLCrime.h"

@implementation NFLCrime

- (instancetype)initWithCategory:(NSString *)category arrestCount:(NSNumber *)arrestCount
{
    self = [super init];
    if (self) {
        _category = category;
        _arrestCount = arrestCount;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    NSString *category = dict[@"Category"];
    NSNumber *arrestCount = dict[@"arrest_count"];
    return [self initWithCategory:category arrestCount:arrestCount];
}

@end
