//
//  iOSSimCameraErrorSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/27.
//

import SwiftUI
import SlideKit

@Slide
struct iOSSimCameraErrorSlide: View {

    var body: some View {
        SlideText("シミュレーターでカメラを起動するとクラッシュ")
    }

}

struct iOSSimCameraErrorSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            iOSSimCameraErrorSlide()
        }
    }
}
