//
//  FindMonth.swift
//  Horoscope
//
//  Created by Никита Фролов  on 17.02.2021.
//

import Foundation


enum Month {
    static let January = "Января"
    static let February = "Февраля"
    static let March = "Марта"
    static let April = "Апреля"
    static let May = "Мая"
    static let June = "Июня"
    static let July = "Июля"
    static let August = "Августа"
    static let September = "Сентебря"
    static let October = "Октября"
    static let November = "Ноября"
    static let December = "Декабря"
}

let arrayOfAllSign = [
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpio",
    "Sagittarius",
    "Capricorn",
    "Aquarius",
    "Pisces"
]

let dictOfMonth = [
    "January": "Января",
    "February": "Февраля",
    "March": "Марта",
    "April": "Апреля",
    "May": "Мая",
    "June": "Июня",
    "July": "Июля",
    "August": "Августа",
    "September": "Сентебря",
    "October": "Октября",
    "November": "Ноября",
    "December": "Декабря"
]

func findMonth(date: Date)->String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM"
    let month = formatter.string(from: date)
    guard let strMonth = dictOfMonth[month] else { return "" }
    formatter.dateFormat = "dd"
    let day = formatter.string(from: date)
    formatter.dateFormat = "yyyy"
    let year = formatter.string(from: date)
    return day + " " + strMonth + " " + year
}
