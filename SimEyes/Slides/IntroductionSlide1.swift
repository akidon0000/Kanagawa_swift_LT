//
//  IntroductionSlide1.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/14.
//

import SwiftUI
import SlideKit

@Slide
struct IntroductionSlide1: View {
    var body: some View {
        Image("shu223-slide")
            .overlay(
                VStack{
                    Spacer()
                    HStack(alignment: .bottom){
                        Spacer()
                        Text("https://www.docswell.com/s/shu223/ZJL233-dockkit")
                            .font(.system(size: 30))
                    }
                }
            )
    }
    
    
    var script: String {
        """
        iPhoneに手足が生えました
        """
    }
}


struct IntroductionSlide1_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            IntroductionSlide1()
        }
    }
}
