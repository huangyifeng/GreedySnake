//
//  GSPoint.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/27.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "GSPoint.h"

@implementation GSPoint

#pragma mark - init

- (instancetype)initWithX:(NSInteger)x Y:(NSInteger)y
{
    if (self = [super init])
    {
        self.x = x;
        self.y = y;
    }
    return self;
}

#pragma mark - public

- (void)moveStep:(NSInteger)step direction:(GSDirection)direction
{
    switch (direction)
    {
        case GSDirectionUp:
            self.y -= step;
            break;
        case GSDirectionDown:
            self.y += step;
            break;
        case GSDirectionRight:
            self.x += step;
            break;
        case GSDirectionLeft:
            self.x -= step;
            break;
        default:
            break;
    }
}

#pragma mark - override

- (BOOL)isEqual:(id)object
{
    BOOL equal = NO;
    if ([object isKindOfClass:[GSPoint class]])
    {
        equal = _x == [(GSPoint *)object x];
        equal = equal && _y == [(GSPoint *)object y];
    }
    return equal;
}

- (id)copy
{
    GSPoint *copy = [[GSPoint alloc] initWithX:_x Y:_y];
    return copy;
}

- (NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"point X: %ld -- Y: %ld",_x, _y];
    return desc;
}

@end
