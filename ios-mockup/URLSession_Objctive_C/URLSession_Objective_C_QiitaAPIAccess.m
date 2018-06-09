//
//  URLSession_Objective_C_QiitaAPIAccess.m
//  ios-mockup
//
//  Created by yuyaokoshi on 2018/06/03.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

#import "URLSession_Objective_C_QiitaAPIAccess.h"
#import "URLSession_Objective_C_Article.h"
#import <Foundation/Foundation.h>
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



- (void)urlAccess {
    // URLコンポーネント
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:@"https://qiita.com/api/v2/items"];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"per_page" value:@"5"]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:urlComponents.URL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                     html = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
                                      
                                     // NSLog(@"html = %@",html);
                                      NSData *jsonData = [html dataUsingEncoding:NSUnicodeStringEncoding];
                                      self.array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
                                      
                                      NSMutableArray *results = [[NSMutableArray alloc] init];
                                      for (NSDictionary *obj in self.array)
                                      {
                                          Article *article = [[Article alloc] init];
                                          article.title = [obj objectForKey:@"title"];
                                          //article.user = [obj objectForKey:@"user"];
                                          [results addObject:article];
                                      }
                                     
                                  }];
    
    [task resume];
    
   

    
}


@end

