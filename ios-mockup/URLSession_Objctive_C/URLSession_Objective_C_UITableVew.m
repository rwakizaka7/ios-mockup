//
//  URLSession_Objective_C_UITableVew.m
//  ios-mockup
//
//  Created by yuyaokoshi on 2018/06/03.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

#import "URLSession_Objective_C_UITableVew.h"
#import "URLSession_Objective_C_QiitaAPIAccess.h"
#import "URLSession_Objective_C_Article.h"
#import <Foundation/Foundation.h>


/**
 インターフェースの宣言
 外部アクセス不可なメンバ変数やメソッドを宣言する・
 */
@interface URLSession_Objective_C_UITableVew ()


@end

/**
 クラスの定義
 メソッドの処理を書く。
 */
@implementation URLSession_Objective_C_UITableVew
    //URLアクセスクラスのインスタンスを生成



/**
 テーブルビューのセルを返す
 @param tableView 対象のテーブルビュー
 @param indexPath 対象の行
 @return セル
 */
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    Article *article = [[Article alloc] init];
    // 追加するセルを取得する？？
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
    // セルのテキストを編集する
   // cell.textLabel.text = [self.articleList objectAtIndex:indexPath.row];
    cell.textLabel.text = article.title;
    
    return cell;
    
}

/**
 テービュルビューの行数を返す。

 @param tableView 対象のテーブルビュー
 @param section 対象のセクション
 @return テーブルの行数
 */
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}



@end
