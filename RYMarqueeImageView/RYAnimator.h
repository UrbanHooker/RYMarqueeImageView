//
//  RYAnimator.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYAnimationDelegate.h"
#import "RYAnimationEffectKey.h"

typedef void (^CompletionBlock)();

@interface RYAnimator : NSObject <RYAnimationDelegate>

@property (nonatomic, assign) NSTimeInterval     durition;
@property (nonatomic, strong) RYAnimationContext *context;
@property (nonatomic, assign) NSString           *effect;

- (void)startAnimationWithCompletionBlock:(CompletionBlock)complitionBlock;

@end
