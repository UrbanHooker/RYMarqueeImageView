//
//  NSMutableArray+Queue.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

- (_Nonnull instancetype)init;

- (void)enqueue:(id _Nonnull)object;

- (id _Nullable)dequeue;

- (void)emptyQueue;

- (NSString * _Nonnull)description;

@end
