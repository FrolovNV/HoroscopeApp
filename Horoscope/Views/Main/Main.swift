//
//  Main.swift
//  Horoscope
//
//  Created by Никита Фролов  on 22.02.2021.
//

import SwiftUI

struct Main: View {
    
    @State private var selection: Tab = .horoscope
    @ObservedObject var user: UserDate
    
    enum Tab {
        case horoscope
        case square
        case compatibility
    }

    var body: some View {
        TabView(selection: $selection) {
            
            //Horoscope
            NavigationView {
                HoroscopeView(user: self.user)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "circles.hexagonpath.fill")
                Text("Гороскоп")
            }
            .tag(Tab.horoscope)
            
            //Square
            NavigationView {
                SquareView(user: self.user)
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "square.grid.3x3.fill")
                Text("Психоматрица")
            }
            .tag(Tab.square)
            
            
            //Compatibility
            NavigationView {
                CompChooseSignView(user: user)
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "heart.circle")
                Text("Совместимость")
            }
            .tag(Tab.compatibility)
        }
        .accentColor(.blue)
    }
}
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(user: UserDate())
    }
}
