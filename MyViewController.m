//
//  MyViewController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/2.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "MyViewController.h"
#import "CommonDefine.h"
#import "ACMacros.h"
#import "SettingTableViewController.h"
#import "CustomNavigationController.h"
#import "CustomWebView.h"

@interface MyViewController ()

@property (strong, nonatomic) CustomWebView *webView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [CustomWebView sharedCustomWebView];
    [self loadPage];
    [self.view addSubview:self.webView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(Main_Screen_Width - 50, 400, 34, 34);
    //[button setTitle:@"设置" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.webView addSubview:button];
    
    [self.webView setBackgroundColor:[UIColor clearColor]];
    [self.webView setOpaque:NO];
}

- (void)loadPage {
    NSURL *url = [NSURL URLWithString:URL_PERSONAL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

- (void)press {
    SettingTableViewController *settingController = [[SettingTableViewController alloc] init];
    CustomNavigationController *navi = [[CustomNavigationController alloc] initWithRootViewController:settingController];
    [self presentViewController:navi animated:YES completion:nil];
    
    //[[NSURLCache sharedURLCache] removeAllCachedResponses];
}

- (void)printCookies {
    NSHTTPCookieStorage *sharedHTTPCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [sharedHTTPCookieStorage cookiesForURL:[NSURL URLWithString:URL_PERSONAL]];
    NSEnumerator *enumerator = [cookies objectEnumerator];
    NSHTTPCookie *cookie;
    while (cookie = [enumerator nextObject]) {
        NSLog(@"COOKIE{name: %@, value: %@}", [cookie name], [cookie value]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
