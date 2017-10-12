//
//  AppDelegate.h
//  RealWonder
//
//  Created by Azat Melikyan on 10/8/17.
//  Copyright © 2017 RealWonder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

