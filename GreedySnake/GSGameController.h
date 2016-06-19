//
//  GSGameController.h
//  GreedySnake
//
//  Created by huang yifeng on 16/6/1.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSSnake.h"
#import "GSMap.h"


@protocol GSGameControllerDelegate <NSObject>

- (void)hintGameOver;
- (void)updateWithImage:(UIImage *)image;

@end


@interface GSGameController : NSObject

@property(nonatomic, weak)id<GSGameControllerDelegate> delegate;

- (instancetype)initWithMapSize:(CGSize)mapSize;

//- (void)swipeToDirection:()
- (void)startNewGame;
- (void)stopGame;

@end

