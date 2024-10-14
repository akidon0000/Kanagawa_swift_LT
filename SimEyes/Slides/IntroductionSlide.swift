//
//  IntroductionSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/14.
//

import SwiftUI
import SlideKit

@Slide
struct IntroductionSlide: View {
    var body: some View {
        HeaderSlide("SlideKit") {
            Item("SlideKit helps you make presentation slides by SwiftUI.")
            Item("The followings are provided.") {
                Item("Views")
                Item("Structures")
                Item("Utilities")
            }
        }
    }
}


struct IntroductionSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            IntroductionSlide()
        }
    }
}
