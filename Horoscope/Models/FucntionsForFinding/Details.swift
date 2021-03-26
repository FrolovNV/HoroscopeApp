//
//  Details.swift
//  Horoscope
//
//  Created by Никита Фролов  on 19.02.2021.
//

import Foundation


enum UserDefNaming {
    static let day = "dateOfBirth"
}


func fromStringToDate(str: String)->Date {
    let dateFormmater = DateFormatter()
    dateFormmater.dateFormat = "dd.MM.yyyy"
    guard let date = dateFormmater.date(from: str) else {return Date()}
    return date
}


func fromDateToString(date: Date)->String {
    let dateFormmater = DateFormatter()
    dateFormmater.dateFormat = "dd.MM.yyyy"
    let str = dateFormmater.string(from: date)
    return str
}
