//
//  GSBean.h
//  GreedySnake
//
//  Created by huang yifeng on 16/5/30.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPoint.h"

@interface GSBean : NSObject

@property(nonatomic, strong)GSPoint *position;

+ (GSBean *)getRandomBeanFromPoints:(NSArray<GSPoint *> *)from without:(NSArray<GSPoint *> *)without;

@end
