//
//  CommonDefine.m
//  TJC_Shop
//
//  Created by Gavin ican on 15/4/3.
//  Copyright (c) 2015年 Wohui. All rights reserved.
//

#import "CommonDefine.h"

@implementation CommonDefine

+ (NSString *) getUrlStringFromKey:(NSString *)key {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:URL_JSON,URL_KEY]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"GET"];
    NSError *error = nil;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    NSData *dataDecoded = [[NSData alloc] initWithBase64EncodedData:returnData options:0];
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:dataDecoded options:0 error:nil];
    
    NSDictionary *urlDatas = [jsonData objectForKey:@"datas"];
    NSString *urlString = [urlDatas objectForKey:key];
    return urlString;
}



@end
