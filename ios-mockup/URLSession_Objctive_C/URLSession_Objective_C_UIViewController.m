//
//  URLSession_ViewController.m
//  ios-mockup
//
//  Created by 脇坂亮太 on 2018/06/03.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

#import "URLSession_Objective_C_UIViewController.h"
#import "URLSession_Objective_C_UITableVew.h"
#import "URLSession_Objective_C_QiitaAPIAccess.h"
#import <Foundation/Foundation.h>

/**
 インターフェースの宣言
 外部アクセス不可なメンバ変数やメソッドを宣言する。
 */
@interface URLSession_Objective_C_UIViewController ()


/**
 API取得結果表示テーブル
 */
@property (strong, nonatomic) IBOutlet URLSession_Objective_C_UITableVew *tableView;

@end

/**
 クラスの定義
 メソッドの処理を書く。
 */
@implementation URLSession_Objective_C_UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // テーブルビューのデリゲード
    self.tableView.dataSource = self.tableView;
    self.tableView.delegate = self.tableView;
   
//    // ブロック型変数の定義
//    void (^completion)(NSArray<NSDictionary*> *articleList);
//    // ブロック型変数に処理の入れ方（リテラル）
//    completion = ^(NSArray<NSDictionary*> *articleList) { /* 本体 */ };
    
    // URLアクセスクラスのインスタンスを生成。
    URLSession_Objective_C_QiitaAPIAccess *urlSession_Objective_C_QiitaAPIAccess = [[URLSession_Objective_C_QiitaAPIAccess alloc] init];
    // 記事取得完了後の処理を{}に格納する。
    [urlSession_Objective_C_QiitaAPIAccess getArticle:^(NSArray<NSDictionary *> *articleList) {
        // キータ記事リストをテーブルビューに設定する。
        self.tableView.articleList = articleList;
        // メインスレッド発生時の処理を行う。
        dispatch_async(dispatch_get_main_queue(), ^{
            //  テーブルビューの更新を行う。
            [self.tableView reloadData];
        });
    }];
}

@end
