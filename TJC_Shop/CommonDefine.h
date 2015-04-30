//
//  CommonDefine.h
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/3.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import <Foundation/Foundation.h>

#define URL_KEY_HOME @"home"
#define URL_KEY_CATEGORY @"category"
#define URL_KEY_CART @"spcard"
#define URL_KEY_PERSONAL @"member"

#define URL_JSON @"http://wap.taojincheng.net/get.php?key=%@"
#define URL_KEY @"wohuitao"

#define URL_HOME [CommonDefine getUrlStringFromKey: URL_KEY_HOME]
#define URL_CATEGORY [CommonDefine getUrlStringFromKey: URL_KEY_CATEGORY]
#define URL_CART [CommonDefine getUrlStringFromKey: URL_KEY_CART]
#define URL_PERSONAL [CommonDefine getUrlStringFromKey: URL_KEY_PERSONAL]

#define UI

@interface CommonDefine : NSObject

+ (NSString *)getUrlStringFromKey: (NSString *)key;

@end
