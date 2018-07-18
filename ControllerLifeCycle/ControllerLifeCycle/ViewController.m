//
//  ViewController.m
//  ControllerLifeCycle
//
//  Created by 提运佳 on 2018/4/18.
//  Copyright © 2018年 提运佳. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

/**
 A: 0 -> 1
 一.A控制器从无到有
 A --- -[ViewController viewDidLoad]
 A --- -[ViewController viewWillAppear:]
 A --- -[ViewController viewWillLayoutSubviews]
 A --- -[ViewController viewDidLayoutSubviews]
 A --- -[ViewController viewDidAppear:]
 
 A: 1 -> 0
 B: 0 -> 1
 二.A控制器push到B控制器
 
 1. B完成加载
 B --- -[BViewController viewDidLoad]
 
 2. A将要消失
 A --- -[ViewController viewWillDisappear:]
 
 3. B将要显示+显示布局
 B --- -[BViewController viewWillAppear:]
 B --- -[BViewController viewWillLayoutSubviews]
 B --- -[BViewController viewDidLayoutSubviews]
 
 4. A完全消失
 A --- -[ViewController viewDidDisappear:]
 
 5. B完全显示
 B --- -[BViewController viewDidAppear:]
 
 B: 1 -> 0
 A: 0 -> 1
 三.B控制器pop回A控制器
 
 1. B将要消失
 B --- -[BViewController viewWillDisappear:]
 
 2. A将要显示
 A --- -[ViewController viewWillAppear:]
 
 3. B完全消失
 B --- -[BViewController viewDidDisappear:]
 
 4. A完全显示
 A --- -[ViewController viewDidAppear:]
 */

@interface ViewController ()

@end

@implementation ViewController

//1
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"A --- %s",__func__);
}

#pragma mark - LifeCycle
// 2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"A --- %s",__func__);
}

// 3
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"A --- %s",__func__);
}

// 4
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"A --- %s",__func__);
}

// 5
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"A --- %s",__func__);
}

// -1
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"A --- %s",__func__);
}

// -2
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"A --- %s",__func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BViewController *bVC = [[BViewController alloc] init];
    [self.navigationController pushViewController:bVC animated:YES];
}

@end
