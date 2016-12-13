//
//  RYAnimationContext.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const kDisplaiedLabelKey;
UIKIT_EXTERN NSString *const kWillDisplaiedViewKey;
UIKIT_EXTERN NSString *const kContainerViewKey;

@interface RYAnimationContext : NSObject

@property (nonatomic, weak) UIView *displaiedView;
@property (nonatomic, weak) UIView *willDisplaiedView;
@property (nonatomic, weak) UIView *containerView;

+ (instancetype)contextWithDisplaiedView:(UIView *)displaiedView
                       willDisplaiedView:(UIView *)willDisplaiedView
                           containerView:(UIView *)containerView;

- (instancetype)initWithDisplaiedView:(UIView *)displaiedView
                    willDisplaiedView:(UIView *)willDisplaiedView
                        containerView:(UIView *)containerView;

- (UIView *)viewForKey:(NSString *)viewKey;

@end
