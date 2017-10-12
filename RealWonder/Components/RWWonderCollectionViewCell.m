//
//  RWWonderCollectionViewCell.m
//  RealWonder
//
//  Created by Azat Melikyan on 10/8/17.
//  Copyright © 2017 RealWonder. All rights reserved.
//

#import "RWWonderCollectionViewCell.h"

@interface RWWonderCollectionViewCell ()


@end

@implementation RWWonderCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
    // Initialization code
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup {
    UITapGestureRecognizer *tapOnCell = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnCell)];
    [self addGestureRecognizer:tapOnCell];
    UITapGestureRecognizer *tapOnPicture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnProfile)];
    [self.profileImageView addGestureRecognizer:tapOnPicture];
    UITapGestureRecognizer *tapOnName = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnProfile)];
    [self.nameLabel addGestureRecognizer:tapOnName];
}

- (void)tapOnProfile {
    NSLog(@"Profile Tapped");
}

- (void)tapOnCell {
    NSLog(@"Cell Tapped");
}

- (IBAction)realizeClicked:(UIButton *)sender {
    NSLog(@"Realize Clicked");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Realize" object:nil];
}

@end
