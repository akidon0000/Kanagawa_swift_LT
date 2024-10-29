//
//  TaskSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/29.
//

import SwiftUI
import SlideKit

@Slide
struct TaskSlide: View {

    var body: some View {
        HeaderSlide("課題") {
            Spacer()
            Item("JPEG取得方法の改善（現状はタイマー式）") {
                Item("Macディレクトリの変更を検知する仕組みは見つからず...😢")
            }
            Spacer()
            Item("CLIとシミュレーターとの連携改善") {
                Item("CLIをSPMで作成し、Homebrewで配布。アプリ側のRun Scriptで実行 \n しかし、カメラの動作を任意のタイミングで停止できない")
            }
            Spacer()
            Spacer()
        }
    }
    
    var code: String {
        """

        """
    }
    
    
    var script: String {
        """
        
        """
    }
}


struct TaskSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            TaskSlide()
        }
    }
}
