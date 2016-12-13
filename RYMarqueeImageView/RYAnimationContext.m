//
//  RYAnimationContext.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "RYAnimationContext.h"

NSString *const kDisplaiedLabelKey    = @"displaiedLabelKey";
NSString *const kWillDisplaiedViewKey = @"willDisplaiedViewKey";
NSString *const kContainerViewKey     = @"containerViewKey";

@implementation RYAnimationContext

+ (instancetype)contextWithDisplaiedView:(UIView *)displaiedView
                       willDisplaiedView:(UIView *)willDisplaiedView
                           containerView:(UIView *)containerView {
    
    return [[self alloc] initWithDisplaiedView:displaiedView
                             willDisplaiedView:willDisplaiedView
                                 containerView:containerView];
}

- (instancetype)initWithDisplaiedView:(UIView *)displaiedView
                    willDisplaiedView:(UIView *)willDisplaiedView
                        containerView:(UIView *)containerView {
    
    _displaiedView     = displaiedView;
    _willDisplaiedView = willDisplaiedView;
    _containerView     = containerView;
    
    return self;
}

- (UIView *)viewForKey:(NSString *)viewKey {
    if ([viewKey isEqualToString:kDisplaiedLabelKey]) {
        return _displaiedView;
    }
    else if ([viewKey isEqualToString:kWillDisplaiedViewKey]) {
        return _willDisplaiedView;
    }
    else if ([viewKey isEqualToString:kContainerViewKey]) {
        return _containerView;
    }
    return nil;
}

@end
