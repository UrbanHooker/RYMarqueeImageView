//
//  RYMarqueeLabel.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYAnimator.h"

@interface RYMarqueeImageView : UIView

/**
 Images for looping the marquee imageview.
 
 @discussion You can set images or iamgeviews array to MarqueeImageView, 
 and if you want to just loop for once, set enableLoop property to NO; 
 If you set this property, the image property below will be ignored.
 */
@property (nonatomic, strong) NSArray *images;

/**
 Set the image and MarqueeImageView will animate according to effect
 @discussion Default is nil
 */
@property (nonatomic, strong) UIImage *image;

/**
 Set the imageView and MarqueeImageView will animate according to effect
 @discussion Default is nil
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 Enabel loop when the text array has been set.
 
 @discussion Default is YES
 */
@property (nonatomic, assign, getter = isEnableLoop) BOOL enableLoop;

/**
 The time durition for how long a text displaied.
 
 @discussion Default is 5.0
 */
@property (nonatomic, assign) NSTimeInterval displaiedDuration;

/**
 The time durition for how long a text animate to another text.
 
 @discussion Default is 0.6
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 The animation effect for displaying a text.
 
 @discussion Reference to RYAnimationEffectKey.h
 */
@property (nonatomic, copy  ) NSString *effect;

/**
 This property will ignore the effect you set.
 
 @discussion If set to YES, the effect will be random. Default is NO
 */
@property (nonatomic, assign) BOOL enableRandomEffect;

/**
 A completion block executed when an animation completed.
 
 @discussion Reference to RYAnimationEffectKey.h
 */
@property (nonatomic, copy  ) CompletionBlock completionBlock;

@property (nonatomic, assign) UIViewContentMode contentMode;

/**
 Start the marqueeLabel animation or loop.
 
 @discussion After you have set all the properties you need above,
 you need to call this function manully to start the animation
 */
- (void)startAnimation;

@end
