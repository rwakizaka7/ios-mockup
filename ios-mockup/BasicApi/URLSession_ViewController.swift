//
//  BasicApi_ViewController.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/29.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

import UIKit

/// ビューコントローラー
class URLSession_ViewController: UIViewController {
    /// API取得結果表示テーブル
    @IBOutlet weak var tableView: URLSession_UITableView!
    
    /// Viewをロード後に呼ぶ
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テーブルビューのデリゲード
        tableView.delegate = tableView
        tableView.dataSource = tableView
        
        // テーブルビュー表示までの道
        // ①APIのコールバック待ち＞APIの完了変数の中身呼ばれる。
        // 問題発生：この時のスレッドがサブスレッドのためUIを更新できない。
        // ②メインスレッド待ち＞メインスレッド処理変数の中身が呼ばれる。
        
        /* メインスレッド */
        
        // 引数にAPI呼出し完了後の処理を格納してAPIを呼ぶ。
        URLSession_QiitaAPIAccess().getArticle(completion: { articleList in
            /* サブスレッド */
            
            // キータ記事リストをテーブルビューに設定する。
            self.tableView.articleList = articleList
            //print(articleList)
            
            /// メインスレッド発生時にここで格納した変数の処理を行う。
            DispatchQueue.main.async(execute: {
                /* メインスレッド */
                self.tableView.reloadData()
            })
        })
        
//        // メインスレッドとは別のスレッドを作成する。
//        OperationQueue().addOperation({
//            // 呼出したスレッドとは別のスレッドで呼ぶ。
//        })
    }
}
