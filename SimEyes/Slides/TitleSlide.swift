//
//  TitleSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/14.
//

import SlideKit
import SwiftUI


@Slide
struct TitleSlide: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("iPhoneシミュレーターに目を生やす")
                .fontWeight(.heavy)
                .font(.system(size: 120))
            Text("@akidon0000")
                .fontWeight(.semibold)
                .font(.system(size: 48))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .background(Color.accentColor)
    }
    
    var shouldHideIndex: Bool { true }
}


struct TitleSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            TitleSlide()
        }
    }
}
