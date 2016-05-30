//
//  GSBean.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/30.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSBean.h"

@implementation GSBean


+ (GSBean *)getRandomBeanFromPoints:(NSArray<GSPoint *> *)from without:(NSArray<GSPoint *> *)without
{
    GSBean *bean = [[GSBean alloc] init];
    NSMutableArray *restPoints = [from mutableCopy];
    [restPoints removeObjectsInArray:without];
    
    NSInteger randIndex = arc4random() % restPoints.count;
    bean.position = [restPoints objectAtIndex:randIndex];
    return bean;
}

@end
