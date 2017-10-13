//
//  RWUser.h
//  RealWonder
//
//  Created by User on 10/12/17.
//  Copyright © 2017 RealWonder. All rights reserved.
//

#import <Foundation/Foundation.h>


@import UIKit;

@interface RWVote : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

    @property (nonatomic) NSString *type;
    @property (nonatomic) NSString *country;
    @property (nonatomic) float length;
@end

@interface RWWhish : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *definition;
@property (nonatomic) NSMutableArray<RWVote *> *votes;
@property (nonatomic) int targetRevenue;
@property (nonatomic) int currentRevenue;

@end


@interface RWUser : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *gender;
@property (nonatomic) NSString *country;
@property (nonatomic) int age;
@property (nonatomic) UIImage *profilePicture;
@property (nonatomic) int rate;
@property (nonatomic) NSMutableArray<RWWhish *> *whishes;

@end
