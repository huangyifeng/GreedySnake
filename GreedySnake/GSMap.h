//
//  GSMap.h
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSSnake.h"
#import "GSPoint.h"

@interface GSMap : NSObject

- (instancetype)initWithRow:(NSInteger)rowCount column:(NSInteger)columnCount;

@property(nonatomic, assign, readonly)NSInteger rowCount;
@property(nonatomic, assign, readonly)NSInteger columnCount;

@property(nonatomic, strong)GSSnake *snake;
//@property(nonatomic, strong)NSMutableArray *beans;
@property(nonatomic, strong)GSPoint *bean;

@end
