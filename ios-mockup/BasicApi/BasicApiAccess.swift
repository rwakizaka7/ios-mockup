//
//  BasicApiAccess.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/29.
//  Copyright © 2018年 脇坂亮太. All rights reserved.
//

import Foundation

/// 記事の構造体
/*{
    ・・・
    "title": "Example title",
    "user": {
        "id": "yaotti",
        ・・・
 }*/
struct Article: Codable {
    /// タイトル
    var title: String
    /// ユーザー
    var user: User
    struct User: Codable {
        var id: String
    }
}

class BasicApiAccess {

    /// API通信を行い、JSONデータを取得する
    ///
    /// - Parameter completion: Articleに結果を入れる
    func fetchArticle(completion: @escaping ([Article]) -> Void) {
        
    /// クロージャ内
        
        /// baseURL
        let url = "https://qiita.com/api/v2/items"
        
        /// baseURLの文字列をエンコードする
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        /// クエリ文字列をエンコードする
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50"),
        ]
        
        /// URLSessionDataTaskでAPI通信をおこないJSONデータ取得する。
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                /// JSONデータをデコードする
                let articles = try JSONDecoder().decode([Article].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        /// 通信開始
        task.resume()
    }
}
