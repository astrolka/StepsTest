//
//  Util.m
//  StepsTest
//
//  Created by Александр Смоленский on 16.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "Util.h"

typedef NSString *(^GetWordForNumber)(NSInteger);

@implementation Util

+ (NSString *)parseDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    return [formatter stringFromDate:date];
}

+ (NSString *)wordDeclesionForCount:(NSInteger)count andWords:(NSArray <NSString *> *)declesedWords {
    
    GetWordForNumber getDeclesedWord = ^NSString *(NSInteger numb) {
        if (numb == 1) {
            return declesedWords[0];
        } else if (numb < 5) {
            return declesedWords[1];
        } else {
            return declesedWords[2];
        }
    };
    
    if (count < 21) {
        return getDeclesedWord(count);
    } else {
        NSInteger lastNumber = count % 10;
        return getDeclesedWord(lastNumber);
    }
}

@end
