//
//  TweetInfo.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/28.
//

struct TweetInfo: Hashable {
    let userName: String
    let accountName: String
    let text: String
    let time: String
    
    func displayInfo() {
        print("HTMLから抽出された情報:")
        print("ユーザー名: \(userName)")
        print("アカウント名: \(accountName)")
        print("ツイート本文: \(text)")
        print("投稿日: \(time)")
    }
}
