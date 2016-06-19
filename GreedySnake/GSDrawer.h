//
//  GSDrawer.h
//  GreedySnake
//
//  Created by huang yifeng on 16/5/29.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "GSMap.h"
#import "GSSnake.h"
#import "GSBean.h"

@interface GSDrawer : NSObject

- (instancetype)initWithMap:(GSMap *)map
                      snake:(GSSnake *)snake
                       bean:(GSBean *)bean;

- (void)redrawWithContext:(CGContextRef)context;


@end
