//
//  UserGuideViewController.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/3.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "UserGuideViewController.h"
#import "ACMacros.h"

#define IMAGE1 @"IMG_1181.JPG"
#define IMAGE2 @"IMG_1180.JPG"
#define IMAGE3 @"IMG_1178.JPG"

@interface UserGuideViewController () {
    
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    NSTimer *timer;
    
    int pageCounts; //滑动图片页数
    int currentPageCount; //当前页标记
}


@end

@implementation UserGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGuide];
}

- (void)initGuide {
    pageCounts = 3;
    currentPageCount = 0;
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    [scrollView setContentSize:CGSizeMake(Main_Screen_Width * pageCounts, 0)];
    scrollView.pagingEnabled = YES;//视图整页显示
    scrollView.bounces = NO; //去除滚动反弹效果
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO; //去除滚动条
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    pageControl = [[UIPageControl alloc] init];
    [pageControl setCenter:CGPointMake(Main_Screen_Width / 2 - 20, Main_Screen_Height - 100)];
    pageControl.numberOfPages = pageCounts;
    pageControl.currentPage = currentPageCount;
    [pageControl sizeToFit];
    [self.view addSubview:pageControl];
    
    //start timer
    timer =  [NSTimer scheduledTimerWithTimeInterval:3.0
                                              target:self
                                            selector:@selector(tick)
                                            userInfo:nil
                                             repeats:YES];
    
    [self addImageView];
    [self showCurrentPage];
}

- (void) tick {
    [scrollView setContentOffset:CGPointMake((currentPageCount + 1 == pageCounts ? 0 : currentPageCount + 1) * Main_Screen_Width, 0) animated:YES];
}

- (void)addImageView {
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    [imageView1 setImage:[UIImage imageNamed:IMAGE1]];
    [scrollView addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(Main_Screen_Width, 0, Main_Screen_Width, Main_Screen_Height)];
    [imageView2 setImage:[UIImage imageNamed:IMAGE2]];
    [scrollView addSubview:imageView2];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(Main_Screen_Width * 2, 0, Main_Screen_Width, Main_Screen_Height)];
    [imageView3 setImage:[UIImage imageNamed:IMAGE3]];
    imageView3.userInteractionEnabled = YES; //可响应用户操作
    [scrollView addSubview:imageView3];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"开始体验" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(Main_Screen_Width / 2 - 115, 400, 230, 40)];
    [btn addTarget:self action:@selector(firstpressed) forControlEvents:UIControlEventTouchUpInside];
    [imageView3 addSubview:btn];
}

- (void)showCurrentPage {
    int scrollPageNumber = MAX(0, MIN(pageCounts - 1, (int)(scrollView.contentOffset.x / Main_Screen_Width)));
    
    if(scrollPageNumber != currentPageCount) {
        currentPageCount = scrollPageNumber;
    }
    
    float offset = scrollView.contentOffset.x - (currentPageCount * Main_Screen_Width);
    
    //left
    if(offset < 0) {
        pageControl.currentPage = 0;
        offset = Main_Screen_Width - MIN(-offset, Main_Screen_Width);
        //other
    } else if(offset != 0) {
        //last
        if(scrollPageNumber == pageCounts - 1) {
            pageControl.currentPage = pageCounts - 1;
        } else {
            pageControl.currentPage = (offset > Main_Screen_Width / 2) ? currentPageCount + 1 : currentPageCount;
        }
        //stable
    } else {
        pageControl.currentPage = currentPageCount;
    }
}

- (void)firstpressed {
    self.view.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scroll {
    [self showCurrentPage];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scroll {
    if(timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    [self showCurrentPage];
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
