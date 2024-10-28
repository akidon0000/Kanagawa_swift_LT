//
//  OverviewSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/27.
//

import SwiftUI
import SlideKit

@Slide
struct OverviewSlide: View {
    @State private var showImageConversion = false
    @State private var showTransferArrow = false
    @State private var showFileAccess = false
    @State private var showDisplayOnSimulator = false
    
    var body: some View {
        HeaderSlide("全体像") {
            VStack {
                Spacer() // 画面の中央に配置するためのスペーサー

                HStack(spacing: 80) { // 横の間隔も2倍に
                    // macOSのセクション
                    VStack {
                        SlideText("macOS")
                            .font(.largeTitle) // フォントサイズを大きく

                        VStack(spacing: 40) { // 内部のスペースも2倍
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 500, height: 240) // 幅と高さを2倍に
                                .overlay(SlideText("カメラ映像取得")
                                    .foregroundColor(.white))
                            
                            if showImageConversion {
                                Rectangle()
                                    .fill(Color.orange)
                                    .frame(width: 500, height: 240) // 幅と高さを2倍に
                                    .overlay(SlideText("JPEGに変換")
                                        .foregroundColor(.white))
                                    .transition(.scale) // アニメーション
                            }
                        }
                        .padding(20) // パディングも2倍に
                        .overlay(
                            RoundedRectangle(cornerRadius: 20) // 枠線の角の半径も調整
                                .stroke(Color.gray, lineWidth: 4) // 枠線も2倍に
                        )
                    }
                    
                    // 矢印
                    if showTransferArrow {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 200)) // 矢印のサイズも2倍に
                            .foregroundColor(.gray)
                            .transition(.scale) // アニメーション
                    }
                    
                    // iPhoneシミュレーターのセクション
                    VStack {
                        SlideText("iPhone シミュレーター")
                            .font(.largeTitle) // フォントサイズを大きく
                        
                        VStack(spacing: 40) {
                            if showFileAccess {
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 500, height: 240) // 幅と高さを2倍に
                                    .overlay(SlideText("JPEG取得")
                                        .foregroundColor(.white))
                                    .transition(.scale) // アニメーション
                            }
                            
                            if showDisplayOnSimulator {
                                Rectangle()
                                    .fill(Color.purple)
                                    .frame(width: 500, height: 240) // 幅と高さを2倍に
                                    .overlay(SlideText("表示")
                                        .foregroundColor(.white))
                                    .transition(.scale) // アニメーション
                            }
                        }
                        .padding(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                    }
                }
                .frame(maxWidth: .infinity) // HStackの幅を親ビューに合わせる
                
                Spacer() // 画面の中央に配置するためのスペーサー
            }
            .onAppear {
                // アニメーションの順序を設定
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    showImageConversion = true
                }
                withAnimation(.easeInOut(duration: 1).delay(2.5)) {
                    showTransferArrow = true
                }
                withAnimation(.easeInOut(duration: 1).delay(4)) {
                    showFileAccess = true
                }
                withAnimation(.easeInOut(duration: 1).delay(5.5)) {
                    showDisplayOnSimulator = true
                }
            }
        }
    }
}

struct OverviewSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            OverviewSlide()
        }
    }
}
