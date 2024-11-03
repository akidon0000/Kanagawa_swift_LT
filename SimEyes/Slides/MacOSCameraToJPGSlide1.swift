//
//  MacOSCameraToJPGSlide1.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/27.
//

import SwiftUI
import SlideKit

@Slide
struct MacOSCameraToJPGSlide1: View {

    var body: some View {
        HeaderSlide("カメラ映像をJPEGに変換・保存") {
            HStack {
                CodeText("AVCaptureVideoDataOutput Class")
                SlideText("の")
                CodeText("delegateメソッドから")
            }
            HStack {
                SlideText("1フレームごとに、")
                CodeText("CMSampleBuffer")
                SlideText("を取得する")
            }
            SlideText("次のように変換を行う　CMSampleBuffer → cvPixelBuffer → CIImage → jpeg")
            Code(code, fontSize: 28)
        }
        .overlay {
            HStack {
                CodeText("/tmp/iSimCameraTool_captured_photo.jpg")
                SlideText(" に上書き保存")
            }
            .font(.system(size: 40))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(.leading, 50)
            .padding(.bottom, 10)
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
//    var code: String {
//        """
//        do {
//            let input = try AVCaptureDeviceInput(device: camera)
//            let output = AVCaptureVideoDataOutput()
//            output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
//            output.setSampleBufferDelegate(self, queue: captureQueue)
//            
//            if captureSession.canAddInput(input) && captureSession.canAddOutput(output) {
//                captureSession.addInput(input)
//                captureSession.addOutput(output)
//            }
//        } catch {
//            return
//        }
//        """
//    }
    
    
    var script: String {
        """
        
        """
    }
}


struct MacOSCameraToJPGSlide1_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            MacOSCameraToJPGSlide1()
        }
    }
}
