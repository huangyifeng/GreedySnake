//
//  GSSnake.h
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSCommon.h"

@interface GSSnake : NSObject

@property(nonatomic, assign)GSDirection direction;
//@property(nonatomic, assign)BOOL        isAlive;

@property(nonatomic, assign, readonly)NSInteger length;
@property(nonatomic, assign, readonly)NSArray *snakePoints;

- (void)reset;

- (void)turnLeft;
- (void)turnRight;
- (void)eatOneBean;


@end
