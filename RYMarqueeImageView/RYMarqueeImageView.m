//
//  RYMarqueeLabel.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "Queue.h"
#import "RYMarqueeImageView.h"
#import "UIImage+RYMarquee.h"
#import "RYAnimationContext.h"

@interface RYMarqueeImageView ()

@property (nonatomic, strong) RYAnimator *animator;
@property (nonatomic, strong) Queue      *viewQueue;

@end

@implementation RYMarqueeImageView {
    NSTimer *_timer;
}

#pragma mark - LifeCycle & Init
- (instancetype)init {
    self = [super init];
    if (!self) return self;
    
    self.frame = (CGRect){.size = {100, 100}};
    
    [self p_reset];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    
    [self p_reset];
    return self;
}

- (void)dealloc {
    [self endLoopTimer];
}

#pragma mark - Instance Method
- (void)startAnimation {
    
    if (_images.count>0) {
        
        [self startLoopTimer];
    }
    else {
        
        [self p_animateForOnce];
    }
}

#pragma mark - Timer
- (void)startLoopTimer {
    [_timer invalidate];
    _timer = [NSTimer timerWithTimeInterval:_displaiedDuration target:self selector:@selector(marqueeLoop) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)endLoopTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)marqueeLoop {
    
    static NSInteger textsLoopPtr = 0;
    
    if (textsLoopPtr == _images.count) {
        if (_enableLoop) {
            textsLoopPtr = 0;
        }
        else {
            [self endLoopTimer];
            return;
        }
    }
    
    id view = [_images objectAtIndex:textsLoopPtr++];
    if ([view isKindOfClass:[UIImageView class]]) {
        UIImageView *temp = view;
        _imageView.image  = temp.image;
        _image            = nil;
    }
    else if ([view isKindOfClass:[UIImage class]]) {
        UIImage *temp = view;
        _image        = temp;
        _imageView    = nil;
    }
    else NSLog(@"RYMarqueeImageView images array should be kind of UIImageView, please check");
    
    [self p_animateForOnce];
}

#pragma mark - Helper
- (void)p_animateForOnce {
    
    UIImageView *_willDisplaiedView = [_viewQueue dequeue];
    UIImageView *_displaiedView     = [_viewQueue dequeue];
    
    [_viewQueue enqueue:_displaiedView];
    [_viewQueue enqueue:_willDisplaiedView];
    
    [self p_setupImageViewWithWillDisplaiedLabel:_willDisplaiedView];
    
    [self p_setupAnimatorWithDisplaiedView:_displaiedView
                      andWillDisplaiedView:_willDisplaiedView];
    
    [_animator startAnimationWithCompletionBlock:_completionBlock];
}

- (void)p_setupImageViewWithWillDisplaiedLabel:(UIImageView *)_willDisplaiedLabel {
    
    if (_image) {
        [_willDisplaiedLabel setImage:_image];
    }
    else if (_imageView) {
        [_willDisplaiedLabel setImage:_imageView.image];
    }
    
    _willDisplaiedLabel.contentMode = _contentMode;
}

- (void)p_setupAnimatorWithDisplaiedView:(UIImageView *)_displaiedLabel
                    andWillDisplaiedView:(UIImageView *)_willDisplaiedLabel {
    
    _animator.context = [RYAnimationContext contextWithDisplaiedView:_displaiedLabel
                                                   willDisplaiedView:_willDisplaiedLabel
                                                       containerView:self];
    
    _animator.durition = _animationDuration;
    
    if (_enableRandomEffect) {
        
        NSUInteger whichEffect  = (arc4random() % (kAllEffects.count));
        NSString *choosedEffect = [kAllEffects objectAtIndex:whichEffect];
        _animator.effect        = choosedEffect;
    }
    else {
        _animator.effect = _effect;
    }
}

- (void)p_reset {
    
    self.clipsToBounds = YES;
    
    _image     = nil;
    _imageView = nil;
    
    _displaiedDuration  = 5.f;
    _enableLoop         = YES;
    _effect             = kTopToBottom;
    _enableRandomEffect = NO;
    _contentMode        = UIViewContentModeScaleAspectFill;
    
    UIImageView *temp1  = [[UIImageView alloc] initWithFrame:self.bounds];
    UIImageView *temp2  = [[UIImageView alloc] initWithFrame:self.bounds];
    temp1.contentMode   = _contentMode;
    temp2.contentMode   = _contentMode;
    temp1.clipsToBounds = YES;
    temp2.clipsToBounds = YES;
    
    _viewQueue = [[Queue alloc] init];
    [_viewQueue enqueue:temp1];
    [_viewQueue enqueue:temp2];
    
    _animator          = [[RYAnimator alloc] init];
    _animationDuration = .6f;
}

#pragma mark - Description
- (NSString *)description {
    return [NSString stringWithFormat:@"<frame>:%@   <images>:%@   <enableLoop>:%@   <displaiedDuration>:%f  <animationDuration>:%f   <effect>:%@   <image>:%@   <imageview>:%@", NSStringFromCGRect(self.frame),_images, _enableLoop == YES ? @"YES" : @"NO", _displaiedDuration, _animationDuration, _effect, _image, _imageView];
}

@end
