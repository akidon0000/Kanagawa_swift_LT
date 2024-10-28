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

    enum SlidePhasedState: Int, PhasedState {
        case initial, next
    }

    @Phase var scale: SlidePhasedState

    var body: some View {
        VStack() {
            HeaderSlide("自己紹介") {
                Code(script, fontSize: 38)
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

    var script: String {
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
}

struct SelfIntroductionSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SelfIntroductionSlide()
        }
    }
}
