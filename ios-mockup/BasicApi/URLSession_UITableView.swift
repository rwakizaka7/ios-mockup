//
//  BasicApi_.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/29.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

import UIKit

/// テーブルビュー
class URLSession_UITableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    /// キータ記事リスト
    var articleList: [Article] = []
    
    /// テーブルビューの行数を返す。
    ///
    /// - Parameters:
    ///   - tableView: 対象のテーブルビュー
    ///   - section: 対象のセクション
    /// - Returns: テーブルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    /// テーブルビューのセルを返す。
    ///
    /// - Parameters:
    ///   - tableView: 対象のテーブルビュー
    ///   - indexPath: 対象の行
    /// - Returns: セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 追加するセルを取得する。
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        // 表示するセルのキータ記事を取得する。
        let article: Article = articleList[indexPath.row]
        
        // セルのテキストを編集する。
        cell.textLabel?.text = article.title
        
        // セルの詳細テキストを編集する。
        cell.detailTextLabel?.text = article.user.id

        return cell
    }
}
