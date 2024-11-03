//
//  DisplayImageFromSimSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/29.
//

import SwiftUI
import SlideKit

@Slide
struct DisplayImageFromSimSlide: View {

    var body: some View {
        HeaderSlide("シミュレーターにJPEGを表示") {
            Item("0.1秒に1回 (10 FPS) ディレクトリ内の保存された写真を取ってくる")
            Code(code, fontSize: 40)
        }
    }
    
    var code: String {
        """
        let url = URL(filePath: "/tmp/iSimCameraTool_captured_photo.jpg")
        do {
            let data = try Data(contentsOf: url)
            if let image = UIImage(data: data) {
                
            }
        } catch {
            return
        }
        """
    }
    
    
    var script: String {
        """
        
        """
    }
}


struct DisplayImageFromSimSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            DisplayImageFromSimSlide()
        }
    }
}
