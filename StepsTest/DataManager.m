//
//  DataManager.m
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "DataManager.h"
#import "DayActivityCoreDataModel.h"
#import <CoreData/CoreData.h>

@implementation DataManager

+ (DataManager *) sharedManager {
    static DataManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataManager alloc] init];
    });
    return manager;
}

- (void) addNewActivityData {
    for (NSInteger i = 0; i < 4; i++) {
        DayActivityCoreDataModel *activity = [NSEntityDescription insertNewObjectForEntityForName:@"DayActivity" inManagedObjectContext:self.persistentContainer.viewContext];
        NSInteger secondsInADay = 24*60*60;
        activity.date = [NSDate dateWithTimeIntervalSince1970:secondsInADay * (45*365 + arc4random_uniform(800))];
        activity.walk = arc4random_uniform(4000);
        activity.aerobicWalk = arc4random_uniform(4000);
        activity.run = arc4random_uniform(4000);
    }
    [self saveContext];
}

- (NSManagedObjectContext *)managedObjectContext {
    return [self.persistentContainer viewContext];
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"StepsTest"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
    }
}

@end
