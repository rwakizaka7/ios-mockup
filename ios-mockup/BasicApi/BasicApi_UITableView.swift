//
//  BasicApi_.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/29.
//  Copyright © 2018年 脇坂亮太. All rights reserved.
//

import UIKit

class BasicApi_UITableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    /// テーブルビューの表示データ
    var articles: [Article] = []
    
    /// テーブルビューの行数を返す。
    ///
    /// - Parameters:
    ///   - tableView: 対象のテーブルビュー
    ///   - section: 対象のセクション
    /// - Returns: テーブルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    /// テーブルビューのセルを返す。
    ///
    /// - Parameters:
    ///   - tableView: 対象のテーブルビュー
    ///   - indexPath: 対象の行
    /// - Returns: セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.user.id
        return cell
    }
    

}
