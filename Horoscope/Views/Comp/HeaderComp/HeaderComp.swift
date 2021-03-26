//
//  HeaderComp.swift
//  Horoscope
//
//  Created by Никита Фролов  on 28.02.2021.
//

import SwiftUI

struct HeaderComp: View {
    
    @State var imageNames: [String]
    
    var body: some View {
        HStack {
            Spacer()
            CircleComp(imageName: imageNames[0])
            Image(systemName: "plus")
                .padding(.bottom, 50)
            CircleComp(imageName: imageNames[1])
            Spacer()
        }
    }
}

struct HeaderComp_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComp(imageNames: ["Aries", "Scorpio"])
    }
}
