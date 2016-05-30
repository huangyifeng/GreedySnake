//
//  GSMap.h
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSMap : NSObject

- (instancetype)initWithRow:(NSInteger)rowCount column:(NSInteger)columnCount;

@property(nonatomic, assign, readonly)NSInteger rowCount;
@property(nonatomic, assign, readonly)NSInteger columnCount;

@property(nonatomic, assign, readonly)NSArray *mapPoints;


@end
