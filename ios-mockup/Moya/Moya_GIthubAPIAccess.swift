//
//  Moya_GIthubAPIAccess.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/27.
//  Copyright © 2018年 脇坂亮太. All rights reserved.
//

import Moya
import RxSwift

/// Githubプロファイル構造体
struct GithubProfile: Codable {
    /// メッセージ（API失敗時）
    let message: String?
    
    /// ログインID
    let login: String?
    
    /// URL
    let url: String?
}

/// GithubAPIアクセス
class Moya_GithubAPIAccess {
    /// プロバイダー
    let provider : MoyaProvider<Moya_GithubAPI>! = MoyaProvider<Moya_GithubAPI>()
    
    /// Githubプロファイルを取得する。
    ///
    /// - Parameters:
    ///   - userName: Githubのユーザー名
    ///   - callback: プロファイル取得時の処理
    func getGithubProfile(userName: String, callback: @escaping (GithubProfile?) -> ()) {
        
        // ① 引数にユーザー名とコールバッククロージャー（引数プロファイル）を指定して呼ぶ。
        // ② 引数に呼び出し設定（ユーザーネームを指定した場合の）とAPI完了クロージャー（引数呼び出し結果）を指定して呼ぶ。
        // Githubのプロファイル取得APIを呼び出す。
        provider.request(Moya_GithubAPI.iosMockupProfile(id: userName), completion: { result in /*.paramSample(callback: "jsonData")*/
            // ③ API完了後にここが呼ばれる。
            // プロファイル取得時の処理
            // プロファイル
            var profile: GithubProfile? = nil
            
            switch result {
            case let .success(moyaResponse): // 取得成功時
                // json文字列を取得する。
                let jsonStr: String = NSString(data:moyaResponse.data, encoding:
                    String.Encoding.utf8.rawValue)! as String
                print("受信データ->\(jsonStr)")
                
                // json文字列をプロファイル構造体に格納する。
                do {
                    profile = try JSONDecoder().decode(
                        GithubProfile.self, from: moyaResponse.data)
                }
                catch(let error) { // Jsonデコード失敗時
                    print(error.localizedDescription)
                }
                
                print("API呼び出し成功！！")
            case let .failure(error): // 取得失敗時
                print(error.errorDescription ?? "API呼び出し失敗！")
            }
            // ④ API完了後にプロファイル結果を引数としてコールバッククロージャーを呼ぶ。
            callback(profile)
        })
        
    }
}
