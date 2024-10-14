//
//  PhasedSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/14.
//

import SlideKit
import SwiftUI


@Slide
struct PhasedSlide: View {
    
    enum SlidePhase: Int, PhasedState {
        case initial, second, third
    }

    @Phase var phasedStateStore: SlidePhase
    
    var body: some View {
        HeaderSlide("Phased Slide") {
            Item("Slide can be divided to multiple steps by defining PhasedState.", accessory: nil) {
                Item("1st step", accessory: 1)
                if $phasedStateStore.after(.second) {
                    Item("2nd step", accessory: 2)
                }
                if $phasedStateStore.after(.third) {
                    Item("3rd step", accessory: 3)
                }
            }
        }
    }
}


struct PhasedSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            PhasedSlide()
        }
    }
}
