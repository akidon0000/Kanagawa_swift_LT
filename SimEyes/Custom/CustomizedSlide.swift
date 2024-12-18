//
//  CustomizedSlide.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/14.
//

import SlideKit
import SwiftUI


@Slide
struct CustomizedSlide: View {
    var body: some View {
        HeaderSlide("Customize Slide Theme") {
            Item("HeaderSlide supports HeaderSlideStyle.")
            Item("Item supports ItemStyle") {
                Item("Nested Item can be customized.")
            }
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}


struct CustomHeaderSlideStyle: HeaderSlideStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: .zero) {
            VStack(alignment: .leading, spacing: 80) {
                HStack(spacing: 32) {
                    configuration.header
                        .font(.system(size: 90))
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack(alignment: .leading, spacing: 48) {
                    configuration.content
                        .font(.system(size: 48))
                }
            }
            Spacer(minLength: 0)
        }
        .padding(60)
    }
}


struct CustomItemStyle: ItemStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 45) {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                switch configuration.accessory {
                case .bullet where configuration.itemDepth == 0:
                    Text("・").bold()
                case .bullet:
                    Text(" - ").bold()
                case .number(let number):
                    Text("\(number). ")
                case .string(let string):
                    Text("\(string). ")
                case nil:
                    EmptyView()
                }
                configuration.label
            }
            configuration.child
                .padding(.leading, 90)
        }
    }
}


struct CustomIndexStyle: IndexStyle {
    func makeBody(configuration: Configuration) -> some View {

    }
}


struct CustomizedHeaderSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CustomizedSlide()
        }
        .indexStyle(CustomIndexStyle())
    }
}
