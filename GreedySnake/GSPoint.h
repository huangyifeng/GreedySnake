//
//  GSPoint.h
//  GreedySnake
//
//  Created by huang yifeng on 16/5/27.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSCommon.h"


@interface GSPoint : NSObject

@property(nonatomic, assign)NSInteger x;
@property(nonatomic, assign)NSInteger y;

- (void)moveStep:(NSInteger)step direction:(GSDirection)direction;

@end
