//
//  RWUser.m
//  RealWonder
//
//  Created by User on 10/12/17.
//  Copyright © 2017 RealWonder. All rights reserved.
//

#import "RWUser.h"

@implementation RWVote

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self setupFieldsFromDictionary:dictionary];
    }
    return self;
}

- (void)setupFieldsFromDictionary:(NSDictionary *)dictionary {
    self.type = dictionary[@"typr"];
    self.country = dictionary[@"country"];
    self.length = [dictionary[@"length"] floatValue];
}

@end



@implementation RWWhish

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self setupFieldsFromDictionary:dictionary];
    }
    return self;
}

- (void)setupFieldsFromDictionary:(NSDictionary *)dictionary {
    self.title = dictionary[@"title"];
    self.definition = dictionary[@"definition"];
    self.targetRevenue = [dictionary[@"target_revenue"] floatValue];
    self.currentRevenue = [dictionary[@"current_revenue"] floatValue];
    self.votes = [[NSMutableArray alloc] initWithCapacity:5];
    NSMutableArray *votes = dictionary[@"votes"];
    for(NSDictionary *d in votes) {
        RWVote *vote = [[RWVote alloc] initWithDictionary:d];
        [self.votes addObject:vote];
    }
}

@end




@implementation RWUser
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self setupFieldsFromDictionary:dictionary];
    }
    return self;
}

- (void)setupFieldsFromDictionary:(NSDictionary *)dictionary {
    self.userName = dictionary[@"username"];
    self.password = dictionary[@"password"];
    self.email = dictionary[@"email"];
    self.gender = dictionary[@"gender"];
    self.age = [dictionary[@"age"] intValue];
    self.country = dictionary[@"country"];
    self.profilePicture = [UIImage imageWithData:[dictionary[@"profile_picture"] data]];
    self.rate = [dictionary[@"rate"] intValue];
    NSArray<NSDictionary *> *whishes = dictionary[@"whishes"];
    self.whishes = [[NSMutableArray alloc] initWithCapacity:5];
    for (NSDictionary *w in whishes) {
        RWWhish *whish = [[RWWhish alloc] initWithDictionary:w];
        [self.whishes addObject:whish];
    }
}

@end
