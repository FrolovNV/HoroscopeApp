//
//  ContentView.swift
//  Horoscope
//
//  Created by Никита Фролов  on 16.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .horoscope
    @ObservedObject var user: UserDate
    
    @State var flag: Bool
    
    enum Tab {
        case horoscope
        case square
        case compatibility
    }
    
    var body: some View {
        if flag {
            Main(user: self.user)
        } else {
            Auth(flag: $flag)
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(user: UserDate(), flag: true)
    }
}
