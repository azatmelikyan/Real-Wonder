//
//  ViewController.m
//  RealWonder
//
//  Created by Azat Melikyan on 10/8/17.
//  Copyright © 2017 RealWonder. All rights reserved.
//

#import "ViewController.h"
#import "RWFeedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    RWFeedViewController *feedVC = [[RWFeedViewController alloc] init];//TODO init from storyboard
    [self presentViewController:feedVC animated:NO completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
