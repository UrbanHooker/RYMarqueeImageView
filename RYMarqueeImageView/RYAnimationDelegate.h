//
//  RYAnimationDelegate.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "RYAnimationContext.h"

#ifndef RYAnimationDelegate_h
#define RYAnimationDelegate_h

@protocol RYAnimationDelegate <NSObject>
@optional

- (NSTimeInterval)animationDurition;
- (void)animationInContext:(RYAnimationContext *)animationContext;

@end

#endif
