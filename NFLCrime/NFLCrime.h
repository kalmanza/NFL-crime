//
//  NFLCrime.h
//  NFLCrime
//
//  Created by Kevin Almanza on 4/10/17.
//  Copyright © 2017 Kevin Almanza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFLCrime : NSObject

@property (strong, nonatomic) NSString *category;

@property (strong, nonatomic) NSNumber *arrestCount;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithCategory:(NSString *)category arrestCount:(NSNumber *)arrestCount;

@end
