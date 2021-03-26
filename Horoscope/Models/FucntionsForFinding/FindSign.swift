//
//  FindSign.swift
//  Horoscope
//
//  Created by Никита Фролов  on 17.02.2021.
//

import Foundation


let dictOfSign:Dictionary<String,[String]> = [
    "Aries": ["Овен", "21.03 - 20.04"],
    "Taurus": ["Телец", "21.04 - 21.05"],
    "Gemini": ["Близнецы", "22.05 - 21.06"],
    "Cancer": ["Рак", "22.06 - 22.07"],
    "Leo": ["Лев", "23.07 - 21.08"],
    "Virgo": ["Дева", "22.08 - 23.09"],
    "Libra": ["Весы", "24.09 - 23.10"],
    "Scorpio": ["Скорпион", "24.10 - 22.11"],
    "Sagittarius": ["Стрелец", "23.11 - 22.12"],
    "Capricorn": ["Козерог", "23.12 - 20.01"],
    "Aquarius": ["Водолей", "21.01 - 19.02"],
    "Pisces": ["Рыбы", "20.02 - 20.03"]
]


func findSign(name: String)->String {
    return dictOfSign[name]![0]
}

func findDateForSign(name: String)->String {
    return dictOfSign[name]![1]
}


func findSign(date: Date)->String {
    let formmater = DateFormatter()
    formmater.dateFormat = "dd"
    guard let day = Int(formmater.string(from: date)) else {return ""}
    formmater.dateFormat = "MM"
    guard let month = Int(formmater.string(from: date)) else {return ""}
    
    if (month == 3 && day >= 21) || (month == 4 && day <= 20) {
        return "Aries"
    } else if (month == 4 && day >= 21) || (month == 5 && day <= 20) {
        return "Taurus"
    } else if (month == 5 && day >= 21) || (month == 6 && day <= 21) {
        return "Gemini"
    } else if (month == 6 && day >= 22) || (month == 7 && day <= 22) {
        return "Cancer"
    } else if (month == 7 && day >= 23) || (month == 8 && day <= 23) {
        return "Leo"
    } else if (month == 8 && day >= 24) || (month == 9 && day <= 23) {
        return "Virgo"
    } else if (month == 9 && day >= 24) || (month == 10 && day <= 22) {
        return "Libra"
    } else if (month == 10 && day >= 23) || (month == 11 && day <= 22) {
        return "Scorpio"
    } else if (month == 11 && day >= 23) || (month == 12 && day <= 21) {
        return "Sagittarius"
    } else if (month == 12 && day >= 22) || (month == 1 && day <= 20) {
        return "Capricorn"
    } else if (month == 1 && day >= 21) || (month == 2 && day <= 19) {
        return "Aquarius"
    }
    return "Pisces"
}
