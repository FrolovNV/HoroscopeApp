//
//  HeaderHoroscope.swift
//  Horoscope
//
//  Created by Никита Фролов  on 16.02.2021.
//

import SwiftUI

struct HeaderHoroscope: View {
    
    var imageName: String
    var date: String
    
    var body: some View {
        HStack {
            Spacer()
            Rectangle()
                .frame(width: 150, height: 150, alignment: .center)
                .background(
                    Image(imageName)
                        .resizable()
                )
                .foregroundColor(.clear)
                .padding()
            VStack {
                Text(findSign(name: imageName))
                    .font(.custom("Jost-Bold", size: 25))
                    .bold()
                    .foregroundColor(.black)
                HStack {
                    Text("\(date)")
                        .font(.custom("Jost-Light", size: 14))
                        .foregroundColor(.black)
                }
            }
            .frame(width: 150, height: 100, alignment: .center)
            Spacer()
        }
        .background(Rectangle()
                        .foregroundColor(Color.init("YelowBut"))
                        .frame(height: 180))
    }
}

struct HeaderHoroscope_Previews: PreviewProvider {
    static var previews: some View {
        HeaderHoroscope(imageName: "Pisces", date: "23.02-30.03")
    }
}
