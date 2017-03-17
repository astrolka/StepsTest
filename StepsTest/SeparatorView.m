//
//  SeparatorView.m
//  StepsTest
//
//  Created by Александр Смоленский on 17.03.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "SeparatorView.h"
#import "Util.h"
#import "UIView+UpperSeparator.h"

@implementation SeparatorView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = SEPARATOR_FILL_COLOR;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawUpperStrokeSeparatorInRect:rect];
}


@end
