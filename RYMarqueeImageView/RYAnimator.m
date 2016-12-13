//
//  RYAnimator.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "RYAnimator.h"
#import "UIView+RYMarquee.h"

@interface RYAnimator ()

@property (nonatomic, weak) UIView          *displaiedView;
@property (nonatomic, weak) UIView          *willDisplaiedView;
@property (nonatomic, weak) UIView          *containerView;
@property (nonatomic, copy) CompletionBlock complitionBlock;

@end

@implementation RYAnimator

- (instancetype)init {
    self = [super init];
    if (!self) return self;
    
    _durition = .6f;
    _effect   = kTopToBottom;
    
    return self;
}

#pragma mark - Instance Method
- (void)startAnimationWithCompletionBlock:(CompletionBlock)complitionBlock {
    _complitionBlock = complitionBlock;
    [self animationInContext:_context];
}

#pragma mark - Delegate
- (NSTimeInterval)animationDurition {
    return _durition;
}

- (void)animationInContext:(RYAnimationContext *)animationContext {
    _displaiedView     = [animationContext viewForKey:kDisplaiedLabelKey];
    _willDisplaiedView = [animationContext viewForKey:kWillDisplaiedViewKey];
    _containerView     = [animationContext viewForKey:kContainerViewKey];
    
    if (![[_containerView subviews] containsObject:_displaiedView]) {
        [_containerView addSubview:_displaiedView];
    }
    if (![[_containerView subviews] containsObject:_willDisplaiedView]) {
        [_containerView addSubview:_willDisplaiedView];
    }
    
# pragma clang diagnostic push
# pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:[self p_makeAnimationSelector]];
# pragma clang diagnostic pop
    
}

#pragma mark - Effect
- (void)topToBottomEffect {
    // init start frame
    CGRect containerViewFrame = _containerView.bounds;
    _displaiedView.frame      = containerViewFrame;
    _willDisplaiedView.frame  = containerViewFrame;
    _willDisplaiedView.top    -= CGRectGetHeight(containerViewFrame);
    
    [self p_animationWithBlock:^{
        
        _displaiedView.top       += CGRectGetHeight(containerViewFrame);
        _willDisplaiedView.frame = containerViewFrame;
        
    }];
}
- (void)bottomToTopEffect {
    // init start frame
    CGRect containerViewFrame = _containerView.bounds;
    _displaiedView.frame      = containerViewFrame;
    _willDisplaiedView.frame  = containerViewFrame;
    _willDisplaiedView.top    += CGRectGetHeight(containerViewFrame);
    
    [self p_animationWithBlock:^{
        
        _displaiedView.top       -= CGRectGetHeight(containerViewFrame);
        _willDisplaiedView.frame = containerViewFrame;
        
    }];
    
}
- (void)leftToRightEffect {
    // init start frame
    CGRect containerViewFrame = _containerView.bounds;
    _displaiedView.frame      = containerViewFrame;
    _willDisplaiedView.frame  = containerViewFrame;
    _willDisplaiedView.left   -= CGRectGetWidth(containerViewFrame);
    
    [self p_animationWithBlock:^{
        
        _displaiedView.left      += CGRectGetWidth(containerViewFrame);
        _willDisplaiedView.frame = containerViewFrame;
        
    }];
    
}
- (void)rightToLeftEffect {
    // init start frame
    CGRect containerViewFrame = _containerView.bounds;
    _displaiedView.frame      = containerViewFrame;
    _willDisplaiedView.frame  = containerViewFrame;
    _willDisplaiedView.left   += CGRectGetWidth(containerViewFrame);
    
    [self p_animationWithBlock:^{
        
        _displaiedView.left      -= CGRectGetWidth(containerViewFrame);
        _willDisplaiedView.frame = containerViewFrame;
        
    }];
}

- (void)dissolveEffect {
    // init start frame
    CGRect containerViewFrame = _containerView.bounds;
    _displaiedView.frame      = containerViewFrame;
    _willDisplaiedView.frame  = containerViewFrame;
    
    _displaiedView.alpha     = 1.f;
    _willDisplaiedView.alpha = 0.f;
    
    [self p_animationWithBlock:^{
        
        _displaiedView.alpha     = 0.f;
        _willDisplaiedView.alpha = 1.f;
    }];
}

- (void)flipEffect {
    // init start frame
    CGRect containerViewFrame = _containerView.bounds;
    _displaiedView.frame      = containerViewFrame;
    _willDisplaiedView.frame  = containerViewFrame;
    
    _displaiedView.alpha     = 1.f;
    _willDisplaiedView.alpha = 0.f;
    
    _willDisplaiedView.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI_2, 1, 0, 0);
    
    [self p_animationWithBlock:^{
        
        _willDisplaiedView.layer.transform = CATransform3DIdentity;
        _displaiedView.layer.transform     = CATransform3DRotate(CATransform3DIdentity, M_PI_2, 1, 0, 0);
        
        _displaiedView.alpha     = 0.f;
        _willDisplaiedView.alpha = 1.f;
    }];
}

#pragma mark - Helper
- (void)p_animationWithBlock:(void (^)())animationBlock {
    [UIView animateWithDuration:[self animationDurition]
                          delay:0.f
         usingSpringWithDamping:.9f
          initialSpringVelocity:1.f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:animationBlock
                     completion:^(BOOL finished) {
                         _willDisplaiedView.layer.transform = CATransform3DIdentity;
                         _displaiedView.layer.transform     = CATransform3DIdentity;
                         _willDisplaiedView.alpha           = 1.f;
                         _displaiedView.alpha               = 1.f;
                         
                         if (_complitionBlock)
                             _complitionBlock();
                     }];
}

- (SEL)p_makeAnimationSelector {
    
    NSString *effectString   = [_effect substringFromIndex:1];
    NSString *selectorString = [effectString stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[effectString substringToIndex:1] lowercaseString]];
    selectorString           = [NSString stringWithFormat:@"%@Effect", selectorString];
    
    return NSSelectorFromString(selectorString);
}

@end
