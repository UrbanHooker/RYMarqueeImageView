//
//  RYAnimationEffect.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/13.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const kTopToBottom;
FOUNDATION_EXPORT NSString *const kBottomToTop;
FOUNDATION_EXPORT NSString *const kLeftToRight;
FOUNDATION_EXPORT NSString *const kRightToLeft;
FOUNDATION_EXPORT NSString *const kDissolve;
FOUNDATION_EXPORT NSString *const kFlip;

#define kAllEffects @[kTopToBottom, kBottomToTop, kLeftToRight, kRightToLeft, kDissolve, kFlip]
