//
//  HoroscopeUser.swift
//  Horoscope
//
//  Created by Никита Фролов  on 09.03.2021.
//

import Foundation


struct HoroscopeUser: Hashable, Decodable {
    var date: String
    
    var dateInDate: Date {
        let formmater = DateFormatter()
        formmater.dateFormat = "dd.MM"
        return formmater.date(from: date)!
    }
    
    var generalText: String
    var maleText: String
    var femaleText: String
    var additionText: String
    var loveText: String
    var workText: String
    var healthText: String
    var luckText: String
    var adviceText: String
}

func findHoroscope(dateOfBith: Date, data: [HoroscopeUser])->[String] {
    let forrmater = DateFormatter()
    forrmater.dateFormat = "dd.MM"
    let dateStr = forrmater.string(from: dateOfBith)
    var array = [String]()
    for i in 0..<data.count {
        if data[i].date == dateStr {
            array = [data[i].generalText, data[i].maleText, data[i].femaleText, data[i].additionText, data[i].loveText, data[i].workText, data[i].healthText, data[i].luckText, data[i].adviceText]
        }
    }
    return array
}

struct CompHoroscope: Hashable, Decodable {
    var partner: [String]
    var general: String
    var work: String
    var friendship: String
    var love: String
    var intimacy: String
    var family: String
    var generalPower: String
    var lovePower: String
    var friendshipPower: String
    var workPower: String
    var familyPower: String
}

struct CompForView {
    var partner: [String]
    var arrayOfText: [String]
    var arrayOfProcent: [String]
}


func transformInfoComp(parnter: [String], compInfo: [CompHoroscope])->CompForView {
    var needed = compInfo[0]
    for elem in compInfo {
        if (elem.partner[0] == parnter[0] && elem.partner[1] == parnter[1]) || (elem.partner[0] == parnter[1] && elem.partner[1] == parnter[0]) {
            needed = elem
            break
        }
    }
    
    let arrayOfText = [needed.general, needed.love, needed.friendship, needed.work, needed.family]
    let arrayOfProcent = [needed.generalPower, needed.lovePower, needed.friendshipPower, needed.workPower, needed.familyPower]
    return CompForView(partner: parnter, arrayOfText: arrayOfText, arrayOfProcent: arrayOfProcent)
}
