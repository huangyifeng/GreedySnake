//
//  GSDrawer.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSDrawer.h"
#import "GSConst.h"

@interface GSDrawer ()

@property(nonatomic, assign)CGContextRef context;

@property(nonatomic, strong)GSMap *map;
@property(nonatomic, strong)GSSnake *snake;
@property(nonatomic, strong)GSBean *bean;

- (void)redrawMap;
- (void)redrawSnake;
- (void)redrawBean;

@end

@implementation GSDrawer

- (instancetype)initWithMap:(GSMap *)map snake:(GSSnake *)snake bean:(GSBean *)bean
{
    if (self = [super init])
    {
        self.map = map;
        self.snake = snake;
        self.bean = bean;
    }
    return self;
}

#pragma mark - public

- (void)redrawWithContext:(CGContextRef)context
{
    self.context = context;
    CGContextSetLineWidth(context, 1);
    
    [self redrawMap];
    [self redrawSnake];
    [self redrawBean];
}

#pragma mark - private

- (void)redrawMap
{
    CGSize mapSize = CGSizeMake(_map.columnCount * MAP_GRID_SIZE, _map.rowCount * MAP_GRID_SIZE);
    
    for (NSInteger rowIndex = 0, rowCount = _map.rowCount + 1; rowIndex < rowCount; rowIndex++)
    {
        CGContextMoveToPoint(_context, 0, rowIndex * MAP_GRID_SIZE);
        CGContextAddLineToPoint(_context, mapSize.width, rowIndex * MAP_GRID_SIZE);
        CGContextStrokePath(_context);
    }
    
    for (NSInteger columnIndex = 0, columnCount = _map.columnCount + 1; columnIndex < columnCount; columnIndex++)
    {
        CGContextMoveToPoint(_context, columnIndex * MAP_GRID_SIZE, 0);
        CGContextAddLineToPoint(_context, columnIndex * MAP_GRID_SIZE, mapSize.height);
        CGContextStrokePath(_context);
    }
}

- (void)redrawSnake
{
    NSArray<GSPoint *> *snakePoints = [_snake snakePoints];
    [snakePoints enumerateObjectsUsingBlock:^(GSPoint * _Nonnull point, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect rect = CGRectMake(point.x * MAP_GRID_SIZE, point.y * MAP_GRID_SIZE, MAP_GRID_SIZE, MAP_GRID_SIZE);
        CGContextFillRect(_context, rect);
    }];
}

- (void)redrawBean
{
    
}

@end
