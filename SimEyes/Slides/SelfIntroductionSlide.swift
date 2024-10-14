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
        HeaderSlide("自己紹介") {
            item(name: "名前", content: "akidon0000")
        }
        .overlay {
            HStack(alignment: .bottom) {
                Text("zzz")
//                    .size(32)
                    .multilineTextAlignment(.trailing)
                Image("akidon0000")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.init(degrees: 20))
                    .frame(width: 400)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.trailing, 140)
            .padding(.bottom, 40)
        }
    }

    private func item(name: String, content: String) -> some View {
        HStack(spacing: 32) {
            Text(name)
                .fontWeight(.semibold)
            Capsule()
                .foregroundColor(.accentColor)
                .frame(width: 8)
            Text(content)
        }
//        .slideFontSize(.body)
        .fixedSize()
    }

    var script: String {
        """
        xxx
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
