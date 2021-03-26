//
//  testLink.swift
//  Horoscope
//
//  Created by Никита Фролов  on 05.03.2021.
//

import SwiftUI

struct LinkToSiteWithText: View {
    
    @State var text: String
    @State var nameLink: String
    @State var link: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .font(.custom("Jost-Light", size: 12))
                .foregroundColor(.gray)
            Link(nameLink, destination: URL(string: link)!)
                .font(.custom("Jost-Light", size: 12))
        }
    }
}

struct testLink_Previews: PreviewProvider {
    static var previews: some View {
        LinkToSiteWithText(text: "Текст взят с сайта - ", nameLink: "In-Contri", link: "http://in-contri.ru")
    }
}
