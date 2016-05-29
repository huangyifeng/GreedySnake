//
//  GSMap.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSMap.h"

@interface GSMap ()

@property(nonatomic, assign)NSArray *mapPoints;

- (void)initModelComponent;

- (void)createBean;

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
    self.mapPoints = [NSArray arrayWithArray:points];
}

#pragma mark - private


- (void)createBean
{
    NSMutableArray *restPoints = [_mapPoints mutableCopy];
    NSArray *snakePoints = [_snake snakePoints];
    [restPoints removeObjectsInArray:snakePoints];
    
    NSInteger randIndex = arc4random() % restPoints.count;
    self.bean = [restPoints objectAtIndex:randIndex];
}

@end
