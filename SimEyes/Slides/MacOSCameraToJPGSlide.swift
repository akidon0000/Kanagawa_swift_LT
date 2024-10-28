//
//  MacOSCameraToJPGSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/27.
//

import SwiftUI
import SlideKit

@Slide
struct MacOSCameraToJPGSlide: View {

    var body: some View {
        HeaderSlide("macOSのカメラ映像をjpgに変換") {
            Code(script, fontSize: 40)
        }
    }
    
    var script: String {
        """
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            print("Error: No camera available.")
            return
        }
        """
    }
    
}


struct MacOSCameraToJPGSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            MacOSCameraToJPGSlide()
        }
    }
}
