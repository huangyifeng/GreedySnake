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
@property(nonatomic, assign)CGFloat speedUpFactor;
@property(nonatomic, strong)NSTimer *timer;

- (void)initModelComponent;


@end

@implementation GSGameController

- (instancetype)initWithMap:(GSMap *)map snake:(GSSnake *)snake
{
    if (self = [super init])
    {
        self.map = map;
        self.snake = snake;
    }
    return self;
}

#pragma mark - private

- (void)initModelComponent
{
    self.timer = [NSTimer timerWithTimeInterval:<#(NSTimeInterval)#> target:<#(nonnull id)#> selector:<#(nonnull SEL)#> userInfo:<#(nullable id)#> repeats:<#(BOOL)#>]
}

#pragma mark - public 

- (void)newGameStart
{
    
}



@end