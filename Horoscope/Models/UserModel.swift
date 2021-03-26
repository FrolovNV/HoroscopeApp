//
//  UserModel.swift
//  Horoscope
//
//  Created by Никита Фролов  on 20.02.2021.
//

import Foundation


class UserDate: ObservableObject {
    @Published var date: Date = loadDate()
    @Published var squareData: [SquareData] = load("pyth_square.json")
    @Published var horoscopeUser: [HoroscopeUser] = load("character.json")
    @Published var compData: [CompHoroscope] = load("Comp.json")
}

func loadDate()->Date {
    guard let strDate = UserDefaults.standard.string(forKey: UserDefNaming.day) else {
        return Date()
    }
    return fromStringToDate(str: strDate)
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
