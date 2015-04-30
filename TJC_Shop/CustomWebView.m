//
//  CustomWebView.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/27.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "CustomWebView.h"
#import "ACMacros.h"

@implementation CustomWebView

+ (id)sharedCustomWebView {
    static CustomWebView *sharedCustomWebView = nil;
    //static dispatch_once_t onceToken;
    //dispatch_once(&onceToken, ^{
        sharedCustomWebView = [[self alloc] init];
    //});
    
    return sharedCustomWebView;
}

- (id)init {
    self = [super init];
    if (self) {
        self = [[CustomWebView alloc] initWithFrame:CGRectMake(0, 20, Main_Screen_Width, Main_Screen_Height - 64)];
    }
    return self;
}

@end
