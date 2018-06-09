//
//  URLSession_Objective_C_QiitaAPIAccess.h
//  ios-mockup
//
//  Created by yuyaokoshi on 2018/06/03.
//  Copyright © 2018年 アルサーガパートナーズ株式会社. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 インターフェイスの宣言
 外部アクセス可能なメンバ変数やメソッドを宣言する
 */
@interface URLSession_Objective_C_QiitaAPIAccess : NSObject

@property NSArray *articleList;
@property NSDictionary *obj;
- (void)getArticle:(void (^)(NSArray<NSDictionary*> *articleList))completion;


@end

#ifndef URLSession_Objective_C_QiitaAPIAccess_h
#define URLSession_Objective_C_QiitaAPIAccess_h


#endif /* URLSession_Objective_C_QiitaAPIAccess_h */
