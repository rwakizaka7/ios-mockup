//
//  URLSession_Objective_C_QiitaAPIAccess.m
//  ios-mockup
//
//  Created by yuyaokoshi on 2018/06/03.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

#import "URLSession_Objective_C_QiitaAPIAccess.h"
#import <Foundation/Foundation.h>



/**
 インターフェースの宣言
 外部アクセス不可なメンバ変数やメソッドを宣言する・
 */
@interface URLSession_Objective_C_QiitaAPIAccess ()

@end



@implementation URLSession_Objective_C_QiitaAPIAccess
NSString *html;
NSString *title;
NSString *user;



/*
 
completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler
 
 
 - (NSURLSessionUploadTask *)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;
 
 - (void)getArticle:(void (^)(NSArray<NSDictionary*> *articleList))completion {
 
 */

 - (void)getArticle:(void (^)(NSArray<NSDictionary*> *articleList))completion {
    // URLコンポーネント
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:@"https://qiita.com/api/v2/items"];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"per_page" value:@"50"]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:urlComponents.URL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                     html = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
        
                                      // JSON型を辞書型の配列に変換する。
                                      NSData *jsonData = [html dataUsingEncoding:NSUnicodeStringEncoding];
                                      self.articleList = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
                                      
                                      completion(self.articleList);
                                    
                                      
                                  }];
    
    [task resume];
    
   

    
}


@end

