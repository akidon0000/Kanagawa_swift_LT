//
//  ThanksSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/27.
//

import SwiftUI
import SlideKit

@Slide
struct ThanksSlide: View {

    var body: some View {
        SlideText("ありがとうございました")
    }

}

struct ThanksSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            ThanksSlide()
        }
    }
}
