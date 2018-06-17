//
//  URLSession_Objective_C_UITableVew.m
//  ios-mockup
//
//  Created by yuyaokoshi on 2018/06/03.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

#import "URLSession_Objective_C_UITableVew.h"
#import "URLSession_Objective_C_QiitaAPIAccess.h"
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
//URLアクセスクラスのインスタンスを生成、allocはメモリの確保、initは初期化の意味
URLSession_Objective_C_QiitaAPIAccess *urlSession_Objective_C_QiitaAPIAccess;



/**
 テーブルビューのセルを返す
 @param tableView 対象のテーブルビュー
 @param indexPath 対象の行
 @return セル
 */
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
   urlSession_Objective_C_QiitaAPIAccess = [[URLSession_Objective_C_QiitaAPIAccess alloc] init];
    // セルを取得する
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    // セルのテキストを編集する
    cell.textLabel.text = [[self.articleList valueForKey:@"title"]objectAtIndex:indexPath.row];
    return cell;
    
}

/**
 テービュルビューの行数を返す。
 @param tableView 対象のテーブルビュー
 @param section 対象のセクション
 @return テーブルの行数
 */
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articleList.count;
}

@end
