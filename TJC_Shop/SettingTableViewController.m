//
//  SettingTableViewController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/17.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingAboutViewController.h"
#import "MyViewController.h"

@interface SettingTableViewController () <UIAlertViewDelegate>

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238/255. green:238/255. blue:238/255. alpha:1.];
    
    //self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.opaque = YES;
    self.navigationItem.title = @"设置";
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(leftBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)leftBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else
        return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"清除缓存";
              } //else if (indexPath.row == 1) {
//                cell.textLabel.text = @"这是第二行";
//            } else
//                cell.textLabel.text = @"这是剩下的";
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"帮助信息";
            } else if (indexPath.row == 1) {
                cell.textLabel.text = @"关于";
            }
            break;
        default:
            break;
    }
    
    return cell;
}




#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"是否要清除缓存?"
                                                               delegate:self
                                                      cancelButtonTitle:@"取消"
                                                      otherButtonTitles:@"确认", nil];
                [alert show];
            } //else if (indexPath.row == 1) {
                
            //} else if (indexPath.row == 2) {
                
            //}
            break;
        case 1:
            if (indexPath.row == 0) {
                
            } else if (indexPath.row == 1) {
                SettingAboutViewController *aboutView = [[SettingAboutViewController alloc] init];
                self.navigationController.navigationItem.backBarButtonItem.tintColor = [UIColor blackColor];
                [self.navigationController pushViewController:aboutView animated:YES];
            }
            break;
        default:
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self clearCookies];
    }
}

- (void)clearCookies {
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        NSLog(@"cookie:%@",cookie);
        [storage deleteCookie:cookie];
    }
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
