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
        HeaderSlide("Macのカメラ映像をJPEGに変換・保存") {
            HStack {
                SlideText("カメラの映像は")
                SlideText("CMSampleBuffer")
                    .foregroundStyle(.orange)
                    .fontWeight(.bold)
                SlideText("として得られる")
            }
            Code(code)
            HStack {
                SlideText("AVCapturePhoto")
                    .foregroundStyle(.orange)
                    .fontWeight(.bold)
                SlideText("には")
                SlideText("CMSampleBuffer")
                    .foregroundStyle(.orange)
                    .fontWeight(.bold)
                SlideText("を")
                SlideText("Data?")
                    .foregroundStyle(.orange)
                    .fontWeight(.bold)
                SlideText("にしてくれる")
                SlideText("fileDataRepresentation()")
                    .foregroundStyle(.orange)
                    .fontWeight(.bold)
                SlideText("がある")
            }
            HStack {
                SlideText("今回使う")
                SlideText("AVCaptureOutput")
                    .foregroundStyle(.orange)
                    .fontWeight(.bold)
                SlideText("にはこのようなメソッドは存在しない")
            }
        }
    }
    
    var code: String {
        """
        CMSampleBuffer :
            Core Media で提供されるメディアデータを扱うためのデータ構造
                ・メディアデータ
                ・タイムスタンプ
                ・音声やビデオのメディアタイプ
            を持つ
        """
    }
    
    
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
