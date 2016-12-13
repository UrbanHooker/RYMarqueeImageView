# RYMarqueeImageView
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat-square)](https://raw.githubusercontent.com/UrbanHooker/RYMarqueeImageView/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/RYMarqueeImageView.svg?style=flat-square)](http://cocoapods.org/?q=RYMarqueeImageView)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/RYMarqueeImageView.svg?style=flat-square)](http://cocoapods.org/?q=RYMarqueeImageView)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat-square)](https://www.apple.com/nl/ios/)&nbsp;

A UIImageView with marquee effect

![label](https://github.com/UrbanHooker/RYMarqueeImageView/blob/master/RYMarqueeImageViewDemo/RYMarqueeImageViewDemo/demo.gif?raw=true)

#Installing
##CocoaPods
1. Add `pod 'RYMarqueeImageView'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import "RYMarqueeLabel.h".


##Manually
1. Drag the `RYMarqueeImageView` folder to your project.
2. Import "RYMarqueeImageView.h".

#Usage

If you want to know more details, please reference to the demo :]

```objective-c
#import "RYMarqueeImageView.h"

@property (nonatomic, strong) RYMarqueeLabel *imageview;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageview];
    [self.imageview startAnimation];//< dont't forget call this func
}

- (RYMarqueeLabel *)imageview {
    if(_imageview) return _imageview;
    
    _imageview = [[RYMarqueeImageView alloc] initWithFrame:(CGRect){.size = {100, 100}}];
    ...
    
    // if you have a image array and want to loop it or not
    _imageview.images = @[[UIImage imageNamed:@"1"],
    						 	   [UIImage imageNamed:@"2"],
    							   [UIImage imageNamed:@"3"]];
    _imageview.enabelLoop = YES;
    
    // if you want to modify the animation durition
    _imageview.displaiedDuration  = 2.f;
    _imageview.animationDuration = 5.f;
    
	 // if you want to change the default animation effect
	 _imageview.effect = kBottomToTop;
    
    return _imageview;
}

```

#ChangeLog
##Version: 1.0.0
Initial Build
#License
MIT License







