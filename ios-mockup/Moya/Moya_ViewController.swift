
//
//  MoyaViewController.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/26.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

import UIKit
import Moya
import RxSwift

/// ビューコントローラー
class Moya_ViewController: UIViewController {
    /// API結果取得テーブル
    @IBOutlet weak var tableview: Moya_UITableView!
    
    /// GithubのURL取得ボタン
    @IBOutlet weak var getGithubURLUIButton: UIButton!
    
    /// GithubAPIアクセス
    var moya_GithubAPIAccess: Moya_GithubAPIAccess = Moya_GithubAPIAccess()
    
    /// Viewをロード後に呼ぶ
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデリゲード
        tableview.delegate = tableview
        tableview.dataSource = tableview
    }
    
    /// テーブルビューのデータを取得する。
    ///
    /// - Parameter sender: 押下したオブジェクト
    @IBAction func pushedGethubGitURLButton(_ sender: Any) {
        // Githubプロファイルを取得する。
        let userName: String = "rwakizaka7"
        // ① 引数にユーザー名とコールバッククロージャー（引数プロファイル）を指定して呼ぶ。
        moya_GithubAPIAccess.getGithubProfile(
        userName: userName, callback: {
            // ⑤ コールバッククロージャの戻り値（プロファイル）を受け取る。
            // コールバッククロージャー中身開始
            (profile: GithubProfile?) in
            // ⑥ テーブルビューにプロファイルの一部を表示する。
            // URLを登録する。
            if profile?.url != nil {
                self.tableview.addRow(text: "\(userName)＞\(profile!.url!)")
            }
            // コールバッククロージャ中身終了
        })
    }
}
