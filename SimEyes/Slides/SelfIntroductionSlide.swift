//
//  SelfIntroductionSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/14.
//

import SwiftUI
import SlideKit

@Slide
struct SelfIntroductionSlide: View {

    var body: some View {
        HeaderSlide("自己紹介") {
            item(name: "名前", content: "あきどん")
            item(name: "X(Twitter)", content: "@akidon0000")
            item(name: "所属", content: "徳島大学院 修士2年")
            item(name: "専攻", content: "無機化学")
            item(name: "趣味", content: "サイクリング - ポケカ(New)")
        }
        .overlay {
            VStack() {
                Image("akidon0000")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .clipShape(Circle())
                    .scaledToFit()
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 5)
                    )
                    .padding(.trailing, 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            }
        }
//        VStack() {
//            HeaderSlide("自己紹介") {
//                item(name: "名前", content: "あきどん")
//                item(name: "X(Twitter)", content: "@akidon0000")
//                item(name: "所属", content: "徳島大学院 修士2年")
//                item(name: "専攻", content: "無機化学")
//                item(name: "趣味", content: "サイクリング - ポケカ(New)")
//            }
//            .overlay {
//                VStack() {
//                    Image("akidon0000")
//                        .resizable()
//                        .frame(width: 400, height: 400)
//                        .clipShape(Circle())
//                        .scaledToFit()
//                        .overlay(
//                            Circle()
//                                .stroke(Color.blue, lineWidth: 5)
//                        )
//                        .padding(.trailing, 350)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
//                }
//            }
//        }
//        .frame(maxHeight: .infinity)
//        .padding(.leading)
    }
    
    private func item(name: String, content: String) -> some View {
        HStack(spacing: 32) {
            Text(name)
                .fontWeight(.bold)
            Capsule()
                .foregroundColor(.accentColor)
                .frame(width: 20, height: 10)
            Text(content)
        }
        .fixedSize()
    }
}

struct SelfIntroductionSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SelfIntroductionSlide()
        }
    }
}
