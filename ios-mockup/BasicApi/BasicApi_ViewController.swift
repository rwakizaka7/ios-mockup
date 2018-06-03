//
//  BasicApi_ViewController.swift
//  ios_mockup
//
//  Created by y.okoshi on 2018/05/29.
//  Copyright © 2018年 脇坂亮太. All rights reserved.
//

import UIKit

class BasicApi_ViewController: UIViewController {

    /// API結果取得テーブル
    var basicApiUITableview = BasicApi_UITableView()
    
    /// API取得結果の格納配列
    var articles: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// テーブルビューのデリゲード
        basicApiUITableview.delegate = basicApiUITableview
        basicApiUITableview.dataSource = basicApiUITableview
        
        /// テーブルビューの配置
        basicApiUITableview.frame = view.frame
        view.addSubview(basicApiUITableview)
        
        /// クロージャの戻り値（articles）を受け取る
        BasicApiAccess().fetchArticle(completion: { (articles) in
            self.articles = articles
            self.basicApiUITableview.articles = articles
            print(articles)
            /// テーブルビューの更新
            DispatchQueue.main.async {
                self.basicApiUITableview.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
