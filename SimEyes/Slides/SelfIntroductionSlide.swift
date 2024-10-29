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
        VStack() {
            HeaderSlide("自己紹介") {
                Code(code, fontSize: 38)
            }
            
            Image("akidon0000")
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .scaledToFit()
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 5)
                )
                .padding(30)
        }
        .frame(maxHeight: .infinity)
        .padding(.leading)
    }

    var code: String {
        """
        struct Profile {
            let name = "akidon0000"
            let x    = "@akidon0000"
            var affiliation: String {
                let currentYear = Calendar.current.component(.year, from: Date())
                return 2025 <= currentYear ? "徳島大学院 修士2年" : "Sansan株式会社"
            }
        }
        """
    }
    
    var script: String {
        """
        「あきどん」と言います。徳島で学生をやってます。来年からはSansanでiOSのエンジニアになります。
        趣味は半年前に始めたポケカです〜
        """
    }
}

struct SelfIntroductionSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SelfIntroductionSlide()
        }
    }
}
