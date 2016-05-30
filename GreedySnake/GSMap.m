//
//  GSMap.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSMap.h"
#import "GSPoint.h"

@interface GSMap ()

- (void)initModelComponent;

@end

@implementation GSMap

#pragma mark - init

- (instancetype)initWithRow:(NSInteger)rowCount column:(NSInteger)columnCount
{
    if (self = [super init])
    {
        _rowCount = rowCount;
        _columnCount = columnCount;
        [self initModelComponent];
    }
    return self;
}

- (void)initModelComponent
{
    NSMutableArray *points = [NSMutableArray array];
    for (NSInteger row = 0; row < _rowCount ; row++)
    {
        for (NSInteger column = 0; column < _columnCount; column++)
        {
            GSPoint *point = [[GSPoint alloc] initWithX:column Y:row];
            [points addObject:point];
        }
    }
    _mapPoints = [NSArray arrayWithArray:points];
}

@end
