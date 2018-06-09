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
    
    // 〜〜リストをテーブルビューに設定する。
    self.tableView.articleList = @[@"nepi",@"nepia",@"wwf",@"mintia",@"iPhone",@"note"];
    
    //URLアクセスクラスのインスタンスを生成、allocはメモリの確保、initは初期化の意味
    URLSession_Objective_C_QiitaAPIAccess *urlSession_Objective_C_QiitaAPIAccess = [[URLSession_Objective_C_QiitaAPIAccess alloc] init];
    [urlSession_Objective_C_QiitaAPIAccess urlAccess];
}


@end
