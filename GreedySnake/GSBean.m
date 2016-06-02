//
//  GSBean.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/30.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSBean.h"

@implementation GSBean

- (void)randomFromPoints:(NSArray<GSPoint *> *)from without:(NSArray<GSPoint *> *)without
{
    NSMutableArray *restPoints = [from mutableCopy];
    [restPoints removeObjectsInArray:without];
    
    NSInteger randIndex = arc4random() % restPoints.count;
    self.position = [restPoints objectAtIndex:randIndex];
}

@end
