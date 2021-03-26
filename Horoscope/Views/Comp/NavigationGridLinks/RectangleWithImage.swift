//
//  RectangleWithImage.swift
//  Horoscope
//
//  Created by Никита Фролов  on 28.02.2021.
//

import SwiftUI

struct RectangleWithImage: View {
    
    @State var color: String
    @State var imageName: String
    @State var imageColor: String
    @State var percent: String
    @State var label: String
    
    var body: some View {
            VStack {
                VStack {
                    Image(systemName: imageName)
                        .imageScale(.large)
                        .foregroundColor(Color.init(imageColor))
                    Text("\(percent)%")
                        .font(.custom("Jost-Bold", size: 15))
                        .padding(.top, 5)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 74, height: 80, alignment: .center)
                        .foregroundColor(Color.init(color))
                )
                
                Text(label)
                    .font(.custom("Jost-Light", size: 14))
                    .padding(.top, 6)
            }
            .frame(width: 80, height: 115, alignment: .center)
    }
}

struct RectangleWithImage_Previews: PreviewProvider {
    static var previews: some View {
        RectangleWithImage(color: "LoveBackground", imageName: "heart", imageColor: "Love", percent: "80", label: "Любовь")
    }
}
