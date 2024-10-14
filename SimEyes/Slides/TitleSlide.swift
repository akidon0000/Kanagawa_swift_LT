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
        
        VStack(alignment: .leading) {
            Text("iPhoneシミュレーターに目を生やす")
                .fontWeight(.heavy)
                .font(.system(size: 100))
            
            Text("@akidon0000")
                .fontWeight(.semibold)
                .font(.system(size: 60))
                .padding(.top)
            
        }
        .padding(.leading, 80)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .overlay {
            VStack(alignment: .leading) {
                Text("2024/11/3")
                    .fontWeight(.semibold)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                Text("Kanagawa.swift")
                    .fontWeight(.semibold)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(.leading, 80)
            .padding(.bottom, 40)
        }
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
