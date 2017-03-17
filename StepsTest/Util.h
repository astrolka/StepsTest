//
//  Util.h
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define WALK_COLOR [UIColor colorWithRed:0.65 green:0.27 blue:0.27 alpha:1.f]
#define AEROBIC_COLOR [UIColor colorWithRed:0.91 green:0.71 blue:0.03 alpha:1.f]
#define RUN_COLOR [UIColor colorWithRed:0.83 green:0.43 blue:0.15 alpha:1.f]

#define SEPARATOR_STROKE_COLOR [UIColor colorWithRed:200.f/255.f green:199.f/255.f blue:204.f/255.f alpha:1.f]
#define SEPARATOR_FILL_COLOR [UIColor colorWithRed:239.f/255.f green:239.f/255.f blue:244.f/255.f alpha:1]

@interface Util : NSObject

+ (NSString *)parseDate:(NSDate *)date;
+ (NSString *)wordDeclesionForCount:(NSInteger)count andWords:(NSArray <NSString *> *)declesedWords;

@end
