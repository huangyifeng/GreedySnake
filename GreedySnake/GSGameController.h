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

@interface GSGameController : NSObject

- (instancetype)initWithMap:(GSMap *)map;

- (void)startNewGame;
- (void)stopGame;

@end
