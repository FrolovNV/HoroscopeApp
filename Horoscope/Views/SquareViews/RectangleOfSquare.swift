//
//  RectangleOfSquare.swift
//  Horoscope
//
//  Created by Никита Фролов  on 18.02.2021.
//

import SwiftUI

struct RectangleOfSquare: View {
    
    var number: String
    var title: String
    
    var body: some View {
        VStack {
            if number == "---" {
                LineToRegtangle()
                    .frame(height: 20)
                    .offset(y: 4.5)
            } else {
                Text("\(number)")
                    .font(.custom("Jost-Bold", size: 20))
            }
            Text("\(title)")
                .multilineTextAlignment(.center)
                .font(.custom("Jost-Light", size: 14))
                .frame(width: 79, height: 50, alignment: .center)
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(Color.init("Work"))
        )
        .frame(width: 102, height: 102, alignment: .center)
    }
}

struct RectangleOfSquare_Previews: PreviewProvider {
    static var previews: some View {
        RectangleOfSquare(number: "---", title: "трудолюбие, мастерство")
    }
}
