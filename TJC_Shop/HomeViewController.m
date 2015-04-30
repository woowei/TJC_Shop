//
//  HomeViewController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/3/23.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "HomeViewController.h"
#import "CommonDefine.h"
#import "ACMacros.h"
#import "CustomWebView.h"
#import "SVPullToRefresh.h"

@interface HomeViewController ()

@property (strong, nonatomic) CustomWebView *webView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [CustomWebView sharedCustomWebView];

    [self loadPage];
    [self.view addSubview:_webView];
    [_webView setBackgroundColor:[UIColor clearColor]];
    [_webView setOpaque:NO];
    
    __weak HomeViewController *homevc = self;
    [self.webView.scrollView addPullToRefreshWithActionHandler:^{
        [homevc pullToRefresh];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    //[_webView.scrollView triggerPullToRefresh];
}

//加载页面
- (void)loadPage {
    NSURL *url = [NSURL URLWithString:URL_HOME];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
}

#pragma mark - Actions
- (void)pullToRefresh {
    __weak HomeViewController *homevc = self;
    
    int64_t delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [homevc loadPage];
        [homevc.webView.scrollView.pullToRefreshView stopAnimating];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
