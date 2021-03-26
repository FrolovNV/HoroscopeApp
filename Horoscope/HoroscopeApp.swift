//
//  HoroscopeApp.swift
//  Horoscope
//
//  Created by Никита Фролов  on 16.02.2021.
//

import SwiftUI

@main
struct HoroscopeApp: App {
    
    @StateObject private var user = UserDate()
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    
    init() {
        if !launchedBefore  {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            UserDefaults.standard.set("23.02.2000", forKey: UserDefNaming.day)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(user: user, flag: launchedBefore)
        }
    }
}
