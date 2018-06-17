//
//  URLSession_Objective_C_UITableVew.h
//  ios-mockup
//
//  Created by yuyaokoshi on 2018/06/03.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 インターフェイスの宣言
 外部アクセス可能なメンバ変数やメソッドを宣言する
 */
@interface URLSession_Objective_C_UITableVew: UITableView<UITableViewDelegate, UITableViewDataSource>
    // テーブルビューの表示リスト
    @property (strong, nonatomic) NSArray *articleList;

@end
