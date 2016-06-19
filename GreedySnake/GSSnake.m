//
//  GSSnake.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSSnake.h"
#import "GSPoint.h"

@interface GSSnake ()

@property(nonatomic, strong)NSMutableArray <GSPoint *> *snakeBody;
@property(nonatomic, assign)BOOL    hasBeanEat;

- (void)computeNextMove;

@end

@implementation GSSnake

- (instancetype)init
{
    if (self = [super init])
    {
        [self reset];
    }
    return self;
}


#pragma mark - public

- (void)reset
{
    self.snakeBody = [NSMutableArray array];
    [_snakeBody addObject:[[GSPoint alloc] initWithX:2 Y:0]];
    [_snakeBody addObject:[[GSPoint alloc] initWithX:1 Y:0]];
    [_snakeBody addObject:[[GSPoint alloc] initWithX:0 Y:0]];
    
    self.direction = GSDirectionRight;
    self.hasBeanEat = NO;
}

- (void)eatOneBean
{
    if (!_hasBeanEat)
    {
        _hasBeanEat = YES;
    }
}

- (void)turnLeft
{
    _direction = (_direction + 3) % 4;
}

- (void)turnRight
{
    _direction = (_direction + 1) % 4;
}

- (void)nextMove
{
    [self computeNextMove];
}

#pragma mark - private

- (void)computeNextMove
{
    GSPoint *nextPoint = [_snakeBody[0] copy];
    [nextPoint moveStep:1 direction:_direction];
    
    [_snakeBody insertObject:nextPoint atIndex:0];
    if (_hasBeanEat)
    {
        _hasBeanEat = NO;
    }
    else
    {
        [_snakeBody removeLastObject];
    }
}

- (BOOL)checkCrashSelf
{
    __block BOOL crash = NO;
    GSPoint *head = [_snakeBody objectAtIndex:0];
    [_snakeBody enumerateObjectsUsingBlock:^(GSPoint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0)
        {
            return;
        }
        if ([head isEqual:obj])
        {
            crash = YES;
            *stop = YES;
        }
    }];
    return crash;
}

#pragma mark - Getter & Setter

- (NSInteger)length
{
    return [_snakeBody count];
}

- (NSArray *)snakePoints
{
    return [NSArray arrayWithArray:_snakeBody];
}

- (GSPoint *)snakeHead
{
    return [_snakeBody objectAtIndex:0];
}

@end
