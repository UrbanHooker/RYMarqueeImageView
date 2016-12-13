//
//  AppDelegate.m
//  RYMarqueeImageViewDemo
//
//  Created by Roy Miller on 16/12/13.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ViewController *root        = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
    
    self.window                    = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = nav;
    self.window.backgroundColor    = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
