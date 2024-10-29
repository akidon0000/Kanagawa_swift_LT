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
        HeaderSlide("Macのカメラ映像をJPEGに変換・保存") {
            Item("AVCaptureOutput") {
                HStack {
                    Code(code, fontSize: 28)
                    VStack {
                        SlideText("SMSampleBuffer")
                        SlideText("cvPixelBuffer")
                        SlideText("CIImage")
                        SlideText("CGImage")
                        SlideText("NSImage")
                        SlideText("tiff")
                        SlideText("bitmap")
                        SlideText("jpeg")
                    }
                }
            }
            
            SlideText("/tmp/captured_image.jpg としてキャプチャのたびに上書き保存", fontSize: 60)
        }
    }
    
    var code: String {
        """
        let context = CIContext()
        
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            return
        }
        let nsImage = NSImage(cgImage: cgImage, size: .zero)
        guard let tiffData = nsImage.tiffRepresentation,
              let bitmap = NSBitmapImageRep(data: tiffData),
              let jpeg = bitmap.representation(using: .jpeg, properties: [:]) else {
            return
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
