//
//  BasicApiAccess.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/29.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

import Foundation

/// 記事の構造体
struct Article: Codable {
    /// タイトル
    var title: String
    /// ユーザー
    var user: User
    /// ユーザー構造体
    struct User: Codable {
        var id: String
    }
}

/// キータAPIアクセス
class URLSession_QiitaAPIAccess {
    /// 記事リストを取得する。
    ///
    /// - Parameter completion: 記事リストの取得時の処理。
    func getArticle(completion: @escaping ([Article]) -> Void) {
        // クロージャ内
        
        // URLコンポーネントクラスを作成する。
        var urlComponents = URLComponents(string: "https://qiita.com/api/v2/items")!
        // クエリ文字列をエンコードして追加する。
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50"),
        ]
        
        // API完了処理をタスククラスに指定して、インスタンスを生成する。
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: urlComponents.url!, completionHandler: { data, response, error in
            
            // JSONの戻り値がない場合処理を継続しない。
            var jsonData: Data! = nil
            if data == nil {
                return
            } else {
                jsonData = data
            }
            
            // JSON文字列を記事リストに格納する。
            do {
                // JSONデータをデコードする。
                let articlesList: [Article] = try JSONDecoder().decode([Article].self, from: jsonData)
                completion(articlesList)
            } catch(let error) { // Jsonデコード失敗時
                print(error.localizedDescription)
            }
        })
        
        // タスククラスからAPI通信を行う。
        task.resume()
    }
}
