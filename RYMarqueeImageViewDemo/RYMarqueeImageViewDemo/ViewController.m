//
//  ViewController.m
//  RYMarqueeImageViewDemo
//
//  Created by Roy Miller on 16/12/13.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "ViewController.h"
#import "RYMarqueeImageView.h"
#import "UIView+RYMarquee.h"
#import "UIImage+RYMarquee.h"

@interface ViewController ()

@end

@interface ViewController ()

@property (nonatomic, strong) RYMarqueeImageView *imageview1;
@property (nonatomic, strong) RYMarqueeImageView *imageview2;
@property (nonatomic, strong) RYMarqueeImageView *imageview3;
@property (nonatomic, strong) RYMarqueeImageView *imageview4;
@property (nonatomic, strong) RYMarqueeImageView *imageview5;
@property (nonatomic, strong) RYMarqueeImageView *imageview6;
@property (nonatomic, strong) RYMarqueeImageView *imageview7;
@property (nonatomic, strong) RYMarqueeImageView *imageview8;

@property (nonatomic, strong) UIButton *changeImageview8;
@property (nonatomic, strong) UISwitch *switchEffect;

@end

@implementation ViewController

static CGFloat const edge = 50.f;

#pragma mark - LifeCycle & Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"RYMarqueeImageView";
    
    [self.view addSubview:self.imageview1];
    [self.view addSubview:self.imageview2];
    [self.view addSubview:self.imageview3];
    [self.view addSubview:self.imageview4];
    [self.view addSubview:self.imageview5];
    [self.view addSubview:self.imageview6];
    [self.view addSubview:self.imageview7];
    [self.view addSubview:self.imageview8];
    [self.view addSubview:self.changeImageview8];
    [self.view addSubview:self.switchEffect];
    
    [_imageview1 startAnimation];
    [_imageview2 startAnimation];
    [_imageview3 startAnimation];
    [_imageview4 startAnimation];
    [_imageview5 startAnimation];
    [_imageview6 startAnimation];
    [_imageview7 startAnimation];
    [_imageview8 startAnimation];
    
}

- (void)changeImageview8Image:(UIButton *)button {
    if (_switchEffect.isOn) {
        _imageview8.enableRandomEffect = NO;
    }
    else {
        _imageview8.enableRandomEffect = YES;
    }
    
    _imageview8.image = [self p_generateRandomImage];
    
    [_imageview8 startAnimation];
}

#pragma mark - Getters & Setters
- (RYMarqueeImageView *)imageview1 {
    if(_imageview1 == nil) {
        _imageview1      = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _imageview1.left = edge;
        _imageview1.top  = 80;
        
        _imageview1.layer.cornerRadius  = 10.f;
        _imageview1.layer.masksToBounds = YES;
        
        _imageview1.images = @[[UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"3"],
                               [UIImage imageNamed:@"4"],
                               [UIImage imageNamed:@"5"],
                               [UIImage imageNamed:@"6"]];
        
        _imageview1.animationDuration = .2f;
        _imageview1.effect            = kTopToBottom;
    }
    return _imageview1;
}

- (RYMarqueeImageView *)imageview2 {
    if(_imageview2 == nil) {
        _imageview2         = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _imageview2.left    = self.imageview1.right + edge;
        _imageview2.centerY = self.imageview1.centerY;
        
        _imageview2.layer.cornerRadius  = 10.f;
        _imageview2.layer.masksToBounds = YES;
        
        _imageview2.images = @[[UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"3"],
                               [UIImage imageNamed:@"6"],
                               [UIImage imageNamed:@"5"],
                               [UIImage imageNamed:@"4"]];
        
        _imageview2.displaiedDuration = 2.f;
        _imageview2.effect            = kBottomToTop;
    }
    return _imageview2;
}

- (RYMarqueeImageView *)imageview3 {
    if(_imageview3 == nil) {
        _imageview3         = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _imageview3.left    = self.imageview2.right + edge;;
        _imageview3.centerY = self.imageview2.centerY;
        
        _imageview3.layer.cornerRadius  = 10.f;
        _imageview3.layer.masksToBounds = YES;
        
        _imageview3.images = @[[UIImage imageNamed:@"6"],
                               [UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"4"],
                               [UIImage imageNamed:@"5"],
                               [UIImage imageNamed:@"2"]];
        
        _imageview3.displaiedDuration = 4.f;
        _imageview3.effect            = kLeftToRight;
    }
    return _imageview3;
}

- (RYMarqueeImageView *)imageview4 {
    if(_imageview4 == nil) {
        _imageview4         = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _imageview4.left    = self.imageview3.right + edge;
        _imageview4.centerY = self.imageview2.centerY;
        
        _imageview4.layer.cornerRadius  = 10.f;
        _imageview4.layer.masksToBounds = YES;
        
        _imageview4.images = @[[UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"3"],
                               [UIImage imageNamed:@"4"],
                               [UIImage imageNamed:@"5"],
                               [UIImage imageNamed:@"6"]];
        
        _imageview4.displaiedDuration = 7.f;
        _imageview4.animationDuration = .9f;
        _imageview4.effect            = kRightToLeft;
    }
    return _imageview4;
}

- (RYMarqueeImageView *)imageview5 {
    if(_imageview5 == nil) {
        _imageview5      = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _imageview5.left = edge;
        _imageview5.top  = self.imageview1.bottom + edge;
        
        _imageview5.layer.cornerRadius  = 10.f;
        _imageview5.layer.masksToBounds = YES;
        
        _imageview5.images = @[[UIImage imageNamed:@"6"],
                               [UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"4"],
                               [UIImage imageNamed:@"5"],
                               [UIImage imageNamed:@"3"]];
        
        _imageview5.effect = kDissolve;
    }
    return _imageview5;
}

- (RYMarqueeImageView *)imageview6 {
    if(_imageview6 == nil) {
        _imageview6       = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _imageview6.right = self.view.width - edge;
        _imageview6.top   = self.imageview1.bottom + edge;
        
        _imageview6.layer.cornerRadius  = 10.f;
        _imageview6.layer.masksToBounds = YES;
        
        _imageview6.images = @[[UIImage imageNamed:@"5"],
                               [UIImage imageNamed:@"4"],
                               [UIImage imageNamed:@"3"],
                               [UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"6"]];
        
        _imageview6.effect = kFlip;
    }
    return _imageview6;
}

- (RYMarqueeImageView *)imageview7 {
    if(_imageview7 == nil) {
        _imageview7         = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _imageview7.centerX = self.view.centerX;
        _imageview7.top     = self.imageview6.bottom + edge;
        
        _imageview7.layer.cornerRadius  = 10.f;
        _imageview7.layer.masksToBounds = YES;
        
        _imageview7.images = @[[UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"3"],
                               [UIImage imageNamed:@"4"],
                               [UIImage imageNamed:@"6"],
                               [UIImage imageNamed:@"5"]];
        
        _imageview7.displaiedDuration  = 2.f;
        _imageview7.enableRandomEffect = YES;
    }
    return _imageview7;
}

- (RYMarqueeImageView *)imageview8 {
    if(_imageview8 == nil) {
        _imageview8      = [[RYMarqueeImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
        _imageview8.left = edge;
        _imageview8.top  = self.imageview7.bottom + edge;
        
        _imageview8.layer.cornerRadius  = 5.f;
        _imageview8.layer.masksToBounds = YES;
        _imageview8.enableRandomEffect = YES;
    }
    return _imageview8;
}

- (UIButton *)changeImageview8 {
    if(_changeImageview8 == nil) {
        _changeImageview8                    = [[UIButton alloc] init];
        _changeImageview8.frame              = CGRectMake(0, 0, 80, 50);
        _changeImageview8.centerY            = self.imageview8.centerY;
        _changeImageview8.right              = self.imageview4.right;
        _changeImageview8.layer.cornerRadius = 5.f;
        _changeImageview8.backgroundColor    = [UIColor purpleColor];
        
        [_changeImageview8 setTitle:@"ClickMe" forState:UIControlStateNormal];
        [_changeImageview8 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_changeImageview8 addTarget:self action:@selector(changeImageview8Image:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeImageview8;
}

- (UISwitch *)switchEffect {
    if(_switchEffect == nil) {
        _switchEffect             = [[UISwitch alloc] init];
        _switchEffect.frame       = self.changeImageview8.frame;
        _switchEffect.centerX     = self.changeImageview8.centerX;
        _switchEffect.top         = self.changeImageview8.bottom + 30;
        _switchEffect.tintColor   = [UIColor purpleColor];
        _switchEffect.onTintColor = [UIColor purpleColor];
    }
    return _switchEffect;
}

#pragma mark - Helper
- (UIImage *)p_generateRandomImage {
    
    
    NSUInteger whichEffect  = (arc4random() % 6) + 1;
    return [UIImage imageNamed:[@(whichEffect) stringValue]];
    
    //    CGFloat hue        = ( arc4random() % 256 / 256.0 );
    //    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    //    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    //    UIColor *color     = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    //
    //    return [UIImage imageWithColor:color];
}


@end

