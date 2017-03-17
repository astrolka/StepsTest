//
//  DataManager.h
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSPersistentContainer, NSManagedObjectContext;

@interface DataManager : NSObject

+ (DataManager *)sharedManager;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;
- (NSManagedObjectContext *)managedObjectContext;

- (void) addNewActivityData;

@end
