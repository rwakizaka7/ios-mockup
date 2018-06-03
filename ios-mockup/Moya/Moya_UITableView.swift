//
//  ApiResultUITableview.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/26.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

import UIKit

/// テーブルビュー
class Moya_UITableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    /// テーブルビューの表示データ
    var dataList: [String] = []
    
    /// テーブルビューの行数を返す。
    ///
    /// - Parameters:
    ///   - tableView: 対象のテーブルビュー
    ///   - section: 対象のセクション
    /// - Returns: テーブルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    /// テーブルビューのセルを返す。
    ///
    /// - Parameters:
    ///   - tableView: 対象のテーブルビュー
    ///   - indexPath: 対象の行
    /// - Returns: セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 追加するセルを取得する。
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        // セルのテキストを編集する。
        cell.textLabel?.text = dataList[indexPath.row]
        
        return cell
    }
    
    /// テーブルビューに行を追加する。
    ///
    /// - Parameter text: タイトルに表示する文字列。
    func addRow(text: String) {
        // テーブルビューの表示データに追加する。
        dataList.append(text)
        
        // テーブルビューを更新する。
        self.reloadData()
    }
}
