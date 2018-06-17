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


 /**
  キータAPIアクセス
  @param completion 記事リスト取得時の処理
  */
 - (void)getArticle:(void (^)(NSArray<NSDictionary*> *articleList))completion {
    // URLコンポーネントクラスを作成し、ベースURLをエンコードする。
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:@"https://qiita.com/api/v2/items"];
    // クエリの文字列をエンコードし、追加する。
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"per_page" value:@"50"]];
    // URLリクエストクラスを作成し、リクエストURLを生成する。
    NSURLRequest *request = [NSURLRequest requestWithURL:urlComponents.URL];
    // APIを開始し、完了後にcompletionHandlerの処理が実行される。
     NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *jsonData, NSURLResponse *response, NSError *error) {
        // 取得したJSONデータを辞書型に変換し、記事リストへ格納する。
         self.articleList = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
         // completionに記事リストが返る。
         completion(self.articleList);
                                  }];
    [task resume];
}


@end

