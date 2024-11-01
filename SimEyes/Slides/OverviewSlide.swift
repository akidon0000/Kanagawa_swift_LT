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
    
    enum SlidePhase: Int, PhasedState {
        case initial, second, third
    }
    
    @Phase var slidePhase: SlidePhase
    
    @State private var macOSAnimation = false
    @State private var isCenterArrowAnimated = false
    @State private var iPhoneAnimation = false
    
    var body: some View {
        HeaderSlide("全体像") {
            HStack(spacing: 30) {
                macOSSection
                    .opacity(macOSAnimation ? 1 : 0)
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 200))
                    .foregroundColor(.gray)
                    .transition(.scale)
                    .opacity(isCenterArrowAnimated ? 1 : 0)
                
                iPhoneSimulatorSection
                    .opacity(iPhoneAnimation ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: slidePhase) { newPhase in
                if newPhase == .second {
                    macOSAnimation = true
                }
                if newPhase == .third {
                    isCenterArrowAnimated = true
                    iPhoneAnimation = true
                }
            }
        }
    }
    
    private var macOSSection: some View {
        OverviewSection(
            title: "Command Line Tool",
            subTitle: "(SPMで作成しHomebrewで配布)",
            firstCircleText: "カメラ起動\n映像取得",
            firstCircleColor: Color.blue,
            secondCircleText: "JPEGに\n変換・保存",
            secondCircleColor: Color.orange,
            isAnimation: $macOSAnimation
        )
    }
    
    private var iPhoneSimulatorSection: some View {
        OverviewSection(
            title: "iPhoneシミュレーター",
            subTitle: nil,
            firstCircleText: "JPEG取得",
            firstCircleColor: Color.green,
            secondCircleText: "表示",
            secondCircleColor: Color.purple,
            isAnimation: $iPhoneAnimation
        )
    }
}

struct OverviewSection: View {
    
    let title: String
    let subTitle: String?
    
    let firstCircleText: String
    let firstCircleColor: Color
    
    let secondCircleText: String
    let secondCircleColor: Color
    
    @Binding var isAnimation: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                animatedCircle(text: firstCircleText,
                               color: firstCircleColor,
                               isAnimated: isAnimation)
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
                    .transition(.scale)
                    .opacity(isAnimation ? 1 : 0)
                    .animation(.easeInOut, value: isAnimation)
                
                animatedCircle(text: secondCircleText,
                               color: secondCircleColor,
                               isAnimated: isAnimation)
            }
            .padding(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 4)
            )
            
            Text(title)
                .font(.system(size: 60))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
        .overlay {
            Text(subTitle ?? "")
                .font(.system(size: 40))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.top, 550)

        }
    }
    
    @ViewBuilder
    private func animatedCircle(text: String, color: Color, isAnimated: Bool) -> some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 400, height: 400)
                .scaleEffect(isAnimated ? 1.0 : 0.0)
                .mask(
                    Rectangle()
                        .frame(width: 300, height: 240)
                )
                .overlay(
                    SlideText(text)
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                )
                .animation(.easeInOut(duration: 2), value: isAnimated)
        }
        .frame(width: 300, height: 300)
    }
}

struct OverviewSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            OverviewSlide()
        }
    }
}
