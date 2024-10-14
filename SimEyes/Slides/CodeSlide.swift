//
//  CodeSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/14.
//

import SlideKit
import SwiftUI


@Slide
struct CodeSlide: View {


    var body: some View {
        HeaderSlide("Code Slide") {
            Text("Syntax Highlight is supported.")
            Code(code, fontSize: 32)
        }
    }
}


private let code = """
struct CodeSlide: Slide {

    var body: some View {
        HeaderSlide("Code Slide") {
            Text("Syntax Highlight is supported.")
            Code(code, fontSize: 32)
        }
    }
}
"""


struct CodeSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CodeSlide()
        }
    }
}
