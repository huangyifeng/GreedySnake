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

@interface GSGameController ()

//Model
@property(nonatomic, strong)GSSnake *snake;
@property(nonatomic, strong)GSMap *map;
@property(nonatomic, strong)GSBean *bean;

@property(nonatomic, assign)CGFloat moveDuration;
@property(nonatomic, strong)NSTimer *timer;

- (void)initModelComponent;
- (void)nextMove;

- (BOOL)isSnakeEatBean;
- (BOOL)isSnakeCrashToWall;

@end

@implementation GSGameController

- (instancetype)initWithMap:(GSMap *)map
{
    if (self = [super init])
    {
        self.map = map;
        [self initModelComponent];
    }
    return self;
}

#pragma mark - private

- (void)initModelComponent
{
    self.bean = [[GSBean alloc] init];
    self.snake = [[GSSnake alloc] init];
}

- (void)nextMove
{
    [_snake nextMove];
    
}

- (BOOL)isSnakeEatBean
{
    //@TODO
    return NO;
}

- (BOOL)isSnakeCrashToWall
{
    //@TODO
    return NO;
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
    [_bean randomFromPoints:_map.mapPoints without:_snake.snakePoints];
}

- (void)stopGame
{
    [self.timer invalidate];
    self.timer = nil;
}

@end