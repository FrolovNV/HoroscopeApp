//
//  LineToRegtangle.swift
//  Horoscope
//
//  Created by Никита Фролов  on 10.03.2021.
//

import SwiftUI

struct LineToRegtangle: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 25, height: 4, alignment: .center)
            .foregroundColor((colorScheme == .dark) ? .white : .black)
    }
}

struct LineToRegtangle_Previews: PreviewProvider {
    static var previews: some View {
        LineToRegtangle()
    }
}
