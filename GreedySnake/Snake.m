//
//  Snake.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/27.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "Snake.h"
#import "GSPoint.h"

@interface Snake ()

@property(nonatomic, strong)NSMutableArray <GSPoint *> *snakeBody;
@property(nonatomic, assign)BOOL    hasBeanEat;


- (void)computeNextMove;
- (void)checkCrashSelf;

@end


@implementation Snake

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

#pragma mark - private

- (void)computeNextMove
{
    GSPoint nextPoint = _snakeBody[0];
    switch (_direction)
    {
        case GSDirectionUp:
            
            break;
        case GSDirectionRight:
        case GSDirectionDown:
        case GSDirectionLeft:
        default:
            break;
    }
    
    
    if (_hasBeanEat)
    {
        
        _hasBeanEat = NO;
    }
}

- (void)checkCrashSelf
{
    
}

@end
