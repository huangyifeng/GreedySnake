//
//  GSGameController.m
//  GreedySnake
//
//  Created by huang yifeng on 16/6/1.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSGameController.h"
#import "GSCommon.h"
#import "GSMap.h"
#import "GSSnake.h"
#import "GSBean.h"

#import "GSDrawer.h"

@interface GSGameController ()

//Model
@property(nonatomic, assign)CGSize mapSize;

@property(nonatomic, strong)GSSnake *snake;
@property(nonatomic, strong)GSMap *map;
@property(nonatomic, strong)GSBean *bean;

@property(nonatomic, assign)CGFloat moveDuration;
@property(nonatomic, strong)NSTimer *timer;

@property(nonatomic, strong)GSDrawer *drawer;
@property(nonatomic, assign)CGContextRef context;

- (void)initModelComponent;
- (void)nextMove;
- (void)randomABean;
- (void)hintGameOver;

- (BOOL)isSnakeEatBean;
- (BOOL)isSnakeCrashToWall;

- (void)drawCurrentState;

@end

@implementation GSGameController

- (instancetype)initWithMapSize:(CGSize)mapSize
{
    if (self = [super init])
    {
        self.mapSize = mapSize;
        [self initModelComponent];
    }
    return self;
}

#pragma mark - private

- (void)initModelComponent
{
    NSInteger row = floorf(_mapSize.height / MAP_GRID_SIZE);
    NSInteger column = floorf(_mapSize.width / MAP_GRID_SIZE);
    
    self.map = [[GSMap alloc] initWithRow:row column:column];
    self.bean = [[GSBean alloc] init];
    self.snake = [[GSSnake alloc] init];
}

- (void)nextMove
{
    [_snake nextMove];
    if ([self isSnakeEatBean])
    {
        [_snake eatOneBean];
        [self randomABean];
    }
    else if ([self isSnakeCrashToWall] || [_snake checkCrashSelf])
    {
        [self stopGame];
        [self hintGameOver];
    }
    [self drawCurrentState];
}

- (BOOL)isSnakeEatBean
{
    GSPoint *snakeHead = [_snake snakeHead];
    return [snakeHead  isEqual:_bean];
}

- (BOOL)isSnakeCrashToWall
{
    GSPoint *snakeHead = [_snake snakeHead];
    return snakeHead.x < 0 || snakeHead.x >= _map.columnCount || snakeHead.y < 0 || snakeHead.y >= _map.rowCount;
}

- (void)randomABean
{
    if (!_bean) {
        self.bean = [[GSBean alloc] init];
    }
    [_bean randomFromPoints:_map.mapPoints without:_snake.snakePoints];
}

- (void)hintGameOver
{
    if ([self.delegate respondsToSelector:@selector(hintGameOver)])
    {
        [self.delegate hintGameOver];
    }
}

- (void)drawCurrentState
{
    UIGraphicsBeginImageContext(_mapSize);
    if (!_drawer)
    {
        self.drawer = [[GSDrawer alloc] initWithMap:_map snake:_snake bean:_bean];
    }
    [_drawer redrawWithContext:UIGraphicsGetCurrentContext()];
    if ([self.delegate respondsToSelector:@selector(updateWithImage:)])
    {
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        [self.delegate updateWithImage:image];
    }
    UIGraphicsEndImageContext();
}

#pragma mark - public 

- (void)startNewGame
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:SNAKE_SPEED_DURIATION
                                                  target:self
                                                selector:@selector(nextMove)
                                                userInfo:nil
                                                 repeats:YES];
    [_snake reset];
    [self drawCurrentState];
}

- (void)stopGame
{
    [self.timer invalidate];
    self.timer = nil;
}

@end