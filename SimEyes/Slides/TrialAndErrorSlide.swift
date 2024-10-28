//
//  TrialAndErrorSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/26.
//

import SwiftUI
import SlideKit

@Slide
struct TrialAndErrorSlide: View {

    var body: some View {
        HeaderSlide("試行錯誤") {
            Item("Webサーバーやローカルホストを使う") {
                SlideText("-> なんか違うので却下")
            }
            
            Item("App Group") {
                SlideText("-> 同一プラットフォーム内だけなので×")
            }
            
            Item("`simctl help`では　色々なのが用意されてる") {
                SlideText("-> ただ、上手くできそうなのはなかった")
            }
            
            Item("シミュレーター側からmacOSのディレクトリへのアクセス") {
                SlideText("-> なんか上手くいきそう")
            }
        }
    }
}


struct TrialAndErrorSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview{
            TrialAndErrorSlide()
        }
    }
}
