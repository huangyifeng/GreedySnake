//
//  Snake.h
//  GreedySnake
//
//  Created by huang yifeng on 16/5/27.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSCommon.h"

@interface Snake : NSObject

@property(nonatomic, assign)GSDirection direction;
@property(nonatomic, assign)BOOL        isAlive;

@property(nonatomic, assign, readonly)NSInteger length;


- (void)reset;

- (void)turnLeft;
- (void)turnRight;
- (void)eatOneBean;

@end
