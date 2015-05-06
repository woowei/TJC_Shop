//
//  CustomTabbarController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/2.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "CustomTabbarController.h"
#import "ACMacros.h"

@interface CustomTabbarController ()

@end

@implementation CustomTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //ToolBar按钮设置红色
    [[UITabBar appearance] setSelectedImageTintColor:RGBCOLOR(217, 67, 78)];
    [[UITabBar appearance] setBackgroundColor:RGBCOLOR(80, 80, 80)];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.selectedViewController endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.selectedViewController endAppearanceTransition];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
