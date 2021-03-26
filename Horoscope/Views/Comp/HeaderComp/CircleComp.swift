//
//  CircleComp.swift
//  Horoscope
//
//  Created by Никита Фролов  on 28.02.2021.
//

import SwiftUI

struct CircleComp: View {
    
    @State var imageName: String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 80, height: 80, alignment: .center)
                .background(
                    Image(imageName)
                        .resizable()
                )
                .foregroundColor(.clear)
                .padding()
            Text("\(findSign(name: imageName))")
                .font(.custom("Jost-Bold", size: 18))
            Text("\(findDateForSign(name: imageName))")
                .font(.custom("Just-Light", size: 17))
                .fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct CircleComp_Previews: PreviewProvider {
    static var previews: some View {
        CircleComp(imageName: "Pisces")
    }
}
