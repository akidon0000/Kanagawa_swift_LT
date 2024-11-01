//
//  IntroductionSlide2.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/26.
//

import SwiftUI
import SlideKit

@Slide
struct IntroductionSlide2: View {
    @State private var leftArmOffset: CGFloat = 3000
    @State private var rightArmOffset: CGFloat = -3000
    @State private var legsOffset: CGFloat = 1800
    @State private var brainOffset: CGFloat = -8000

    var body: some View {
        ZStack {

            Image("arms")
                .offset(x: leftArmOffset, y: -250)
            
            Image("arms")
                .scaleEffect(x: -1, y: 1)
                .offset(x: rightArmOffset, y: -250)

            Image("legs")
                .offset(y: legsOffset)
            
            Image("smartphone")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(-34))
                .frame(height: 600)
                .offset(y: -150)
            ZStack {
                Image("brain")
                SlideText("Apple Intelligence")
                    .fontWeight(.bold)
            }
            .offset(y: brainOffset)
            
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 4.0)) {
                leftArmOffset = 300
                rightArmOffset = -300
                legsOffset = 350
            }
            withAnimation(.easeInOut(duration: 8.0)) {
                brainOffset = -400
            }
        }
    }
    
    var script: String {
        """
        これによって、iPhoneに手足が装着され、
        さらにiOS18からApple Intelligenceが
        """
    }
}


struct IntroductionSlide2_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            IntroductionSlide2()
        }
    }
}
