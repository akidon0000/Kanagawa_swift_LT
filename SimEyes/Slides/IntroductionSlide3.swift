//
//  IntroductionSlide3.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/26.
//

import SwiftUI
import SlideKit

@Slide
struct IntroductionSlide3: View {
    @State private var brainOffset: CGFloat = -800

    var body: some View {
        ZStack {
            
            Image("arms")
                .offset(x: 300, y: -250)
        }
    }
}


struct IntroductionSlide3_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            IntroductionSlide3()
        }
    }
}
