//
//  CustomTabbarController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/2.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "CustomTabbarController.h"

@interface CustomTabbarController ()

@end

@implementation CustomTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //ToolBar按钮设置红色
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:217/255. green:67/255. blue:78/255. alpha:1.]];
    [[UITabBar appearance] setBackgroundColor:[UIColor colorWithRed:80/255. green:80/255. blue:80/255. alpha:1.]];
        
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
