//
//  CartViewController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/3/23.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "CartViewController.h"
#import "CommonDefine.h"
#import "ACMacros.h"
#import "CustomWebView.h"

@interface CartViewController ()

@property (strong, nonatomic) CustomWebView *webView;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [CustomWebView sharedCustomWebView];
    [self loadPage];
    [self.view addSubview:_webView];
    [_webView setBackgroundColor:[UIColor clearColor]];
    [_webView setOpaque:NO];
}

- (void)loadPage {
    NSURL *url = [NSURL URLWithString:URL_CART];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
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
