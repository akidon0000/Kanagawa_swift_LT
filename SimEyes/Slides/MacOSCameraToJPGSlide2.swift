//
//  MacOSCameraToJPGSlide2.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/29.
//

import SwiftUI
import SlideKit

@Slide
struct MacOSCameraToJPGSlide2: View {

    var body: some View {
        HeaderSlide("カメラ映像をJPEGに変換・保存") {
            VStack(alignment: .leading) {
                Item("CMSampleBuffer -> cvPixelBuffer -> CIImage -> jpeg")
                    
            }
            Code(code, fontSize: 30)
        }
    }
    
    var code: String {
        """
        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
                return
            }
            
            let ciImage = CIImage(cvPixelBuffer: imageBuffer)
            let context = CIContext()
            
            guard let jpegData = context.jpegRepresentation(of: ciImage, colorSpace: CGColorSpaceCreateDeviceRGB(), options: [:]) else {
                return
            }
        }
        """
    }
    
    
    var script: String {
        """
        
        """
    }
}


struct MacOSCameraToJPGSlide2_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            MacOSCameraToJPGSlide2()
        }
    }
}
