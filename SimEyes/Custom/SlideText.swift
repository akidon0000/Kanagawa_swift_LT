//
//  SlideText.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/29.
//

import SwiftUI

struct SlideText: View {
    var text: String
    var fontSize: CGFloat = 40
    
    // カスタムイニシャライザを追加
    init(_ text: String, fontSize: CGFloat = 40) {
        self.text = text
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
    }
}

struct CodeText: View {
    var text: String
    var fontSize: CGFloat = 40
    
    // カスタムイニシャライザを追加
    init(_ text: String, fontSize: CGFloat = 40) {
        self.text = text
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
            .foregroundStyle(.orange)
            .fontWeight(.bold)
    }
}
