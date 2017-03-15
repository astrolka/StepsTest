//
//  AppDelegate.h
//  StepsTest
//
//  Created by Александр Смоленский on 15.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

