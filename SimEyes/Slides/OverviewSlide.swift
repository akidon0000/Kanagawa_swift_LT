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
    @State private var showAnimationList = [false, false, false, false, false, false, false]
    
    var body: some View {
        HeaderSlide("全体像") {
            VStack {
                Spacer()
                HStack(spacing: 30) {
                    OverViewSection(title: "macOS", firstConversion: $showAnimationList[0],
                                    firstText: "カメラ起動\n映像取得",
                                    firstColor: Color.blue,
                                    arrowConversion: $showAnimationList[1],
                                    secondConversion: $showAnimationList[2],
                                    secondText: "JPEGに変換\n保存",
                                    secondColor: Color.orange)
                    
                    if showAnimationList[3] {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 200))
                            .foregroundColor(.gray)
                            .transition(.scale)
                    }
                    
                    OverViewSection(title: "iPhoneシミュレーター",
                                    firstConversion: $showAnimationList[4],
                                    firstText: "JPEG取得",
                                    firstColor: Color.green,
                                    arrowConversion: $showAnimationList[5],
                                    secondConversion: $showAnimationList[6],
                                    secondText: "表示",
                                    secondColor: Color.purple)
                    
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .onAppear {
                // アニメーションの順序を設定
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    showAnimationList[0] = true
                }
                withAnimation(.easeInOut(duration: 1).delay(2.5)) {
                    showAnimationList[1] = true
                }
                withAnimation(.easeInOut(duration: 1).delay(4)) {
                    showAnimationList[2] = true
                }
                withAnimation(.easeInOut(duration: 1).delay(6.5)) {
                    showAnimationList[3] = true
                }
                withAnimation(.easeInOut(duration: 1).delay(8)) {
                    showAnimationList[4] = true
                }
                withAnimation(.easeInOut(duration: 1).delay(9.5)) {
                    showAnimationList[5] = true
                }
                withAnimation(.easeInOut(duration: 1).delay(11)) {
                    showAnimationList[6] = true
                }
            }
        }
    }
    
    var script: String {
        """
        
        """
    }
}

struct OverViewSection: View {
    let title: String
    
    @Binding var firstConversion: Bool
    let firstText: String
    let firstColor: Color
    
    @Binding var arrowConversion: Bool
    
    @Binding var secondConversion: Bool
    let secondText: String
    let secondColor: Color
    
    var body: some View {
        VStack {
            SlideText(title)
                .font(.largeTitle)

            HStack(spacing: 10) {
                
                if firstConversion {
                    Rectangle()
                        .fill(firstColor)
                        .frame(width: 300, height: 240)
                        .overlay(SlideText(firstText)
                            .foregroundColor(.white))
                        .multilineTextAlignment(.center)
                        .transition(.scale)
                        .animation(.easeInOut, value: firstConversion)
                }
                
                if arrowConversion {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 80))
                        .foregroundColor(.gray)
                        .transition(.scale)
                        .animation(.easeInOut, value: firstConversion || secondConversion)
                }
                
                if secondConversion {
                    Rectangle()
                        .fill(secondColor)
                        .frame(width: 300, height: 240)
                        .overlay(SlideText(secondText)
                            .foregroundColor(.white))
                        .multilineTextAlignment(.center)
                        .transition(.scale)
                        .animation(.easeInOut, value: secondConversion)
                }
            }
            .padding(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 4)
            )
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
