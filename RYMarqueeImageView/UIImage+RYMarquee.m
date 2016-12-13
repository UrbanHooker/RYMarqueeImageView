//
//  UILabel+RYMarquee.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "UIImage+RYMarquee.h"

@implementation UIImage (RYMarquee)

+ (UIImage *)imageWithColor:(UIColor *)color{
    return [self imageWithColor:color size:CGSizeMake(200, 200)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, (CGRect){.size = size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
