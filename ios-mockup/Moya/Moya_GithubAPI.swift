//
//  Moya_GithubAPI.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/27.
//  Copyright © 2018年 脇坂亮太. All rights reserved.
//

import Moya

/// GithubAPI
///
/// - userProfile: ユーザプロファイル取得API
/// - paramSample: パラメーター用のサンプルAPI。GithubのAPIではない。
enum Moya_GithubAPI {
    // https://api.github.com/users/rwakizaka7
    case userProfile(id: String)
    // https://api.github.com/repos/rwakizaka7/ios_mockup
    case iosMockupProfile(id: String)
    // https://randomuser.me/api?callback=jsonData
    case paramSample(callback: String)
    
    // https://api.github.com/users/rwakizaka7/repos
}

// MARK: - Moyaプロトコルの拡張（これによりMoyaに引数として使える）
extension Moya_GithubAPI: TargetType {
    /// URL
    var baseURL: URL {
        switch self {
        case .userProfile:
            return URL(string: "https://api.github.com")!
        case .iosMockupProfile:
            return URL(string: "https://api.github.com")!
        case .paramSample:
            return URL(string: "https://randomuser.me")!
        }
    }
    
    /// パス
    var path: String {
        switch self {
        case .userProfile(let id):
            return "/users/\(id)"
        case .iosMockupProfile(let id):
            return "/repos/\(id)/ios_mockup"
        case .paramSample:
            return "/api"
        }
    }
    
    /// メソッドタイプ
    var method: Method {
        return .get
    }
    
    /// タスク（?以降）
    var task: Task {
        switch self {
        case .userProfile:
            return .requestPlain
        case .iosMockupProfile:
            return .requestPlain
        case .paramSample(let callback):
            // Stringを拡張した結果簡素に書ける。
            // Before
            // callback.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            // After
            // callback.urlEscaped
            return .requestParameters(parameters: ["callback": callback.urlEscaped],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    /// テスト時に読み込むデータ
    var sampleData: Data {
        return "{\"message\": \"Sample Data\"}".utf8Encoded
    }
    
    /// ヘッター
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

// MARK: - String型の拡張
private extension String {
    /// URLエスケープ
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /// 文字列をUTF8データに変換する。
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
