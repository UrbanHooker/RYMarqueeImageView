//
//  NSMutableArray+Queue.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "Queue.h"

@implementation Queue {
    NSMutableArray *_queue;
}

- (instancetype _Nonnull)init {
    if (self = [super init]) {
        _queue = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)enqueue:(id _Nonnull)object {
    [_queue addObject:object];
}

- (id _Nullable)dequeue {
    if (_queue.count > 0) {
        id obj = [_queue firstObject];
        [_queue removeObjectAtIndex:0];
        return obj;
    } else {
        return nil;
    }
}

- (void)emptyQueue {
    [_queue removeAllObjects];
}

- (NSString * _Nonnull)description {
    return [NSString stringWithFormat:@"%@", _queue];
}

@end
