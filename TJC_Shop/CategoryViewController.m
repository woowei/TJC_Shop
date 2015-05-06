//
//  CategoryViewController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/3/23.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "CategoryViewController.h"
#import "CommonDefine.h"
#import "ACMacros.h"
#import "CustomWebView.h"

@interface CategoryViewController ()

@property (strong, nonatomic) CustomWebView *webView;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [CustomWebView sharedCustomWebView];
    [self loadPage];
    [self.view addSubview:self.webView];
    [self.webView setBackgroundColor:[UIColor clearColor]];
    [self.webView setOpaque:NO];
    //[(UIScrollView *)[[self.webView subviews] objectAtIndex:0] setBounces:NO]; //去除滚动反弹效果
}

- (void)loadPage {
    NSURL *url = [NSURL URLWithString:URL_CATEGORY];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
