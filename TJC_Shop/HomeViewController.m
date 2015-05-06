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
@property (strong, nonatomic) UIActivityIndicatorView *theActivityView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [CustomWebView sharedCustomWebView];
    self.theActivityView = [[UIActivityIndicatorView alloc] initWithFrame:self.webView.frame];
    [self.webView addSubview:self.theActivityView];

    [self loadPage];
    [self.view addSubview:self.webView];
    [self.webView setBackgroundColor:[UIColor clearColor]];
    [self.webView setOpaque:NO];
    
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
    if ([URL_HOME isEqualToString:@"failed"]) {
        NSLog(@"无网络……");
        [self loadHTML];
    } else {
        NSURL *url = [NSURL URLWithString:URL_HOME];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];
    }
}

//无网络加载本地html
- (void)loadHTML {
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"nonetwork" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
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

- (void)showLoading
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    self.theActivityView.hidden = NO;
    [self.theActivityView startAnimating];
}

- (void)hideLoading
{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    self.theActivityView.hidden = YES;
    [self.theActivityView stopAnimating];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showLoading];
    NSLog(@"start load");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideLoading];
    NSLog(@"finish load");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideLoading];
    NSLog(@"error load");
}


@end
