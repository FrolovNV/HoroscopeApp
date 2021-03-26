//
//  CalculateSquare.swift
//  Horoscope
//
//  Created by Никита Фролов  on 18.02.2021.
//

import Foundation

func calculateSquare(dateOfBirth: Date)->[(key: Int, value: Int)] {
    let format = DateFormatter()
    format.dateFormat = "dd.MM.yyyy"
    
    let dateStr = format.string(from: dateOfBirth)
    //let dateStr = "23.02.2000"
    
    var arrayOfInt = [Int]()
    
    for ch in dateStr {
        if ch.isNumber {
            arrayOfInt.append(Int(String(ch)) ?? 0)
        }
    }
    
    var dict: Dictionary<Int, Int> = [1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0]
    
    for elem in arrayOfInt {
        if dict[elem] != nil {
            dict[elem] = dict[elem]! + 1
        }
    }
    
    let firstValue = arrayOfInt.reduce(0, +)
    var part1 = firstValue % 10
    var part2 = firstValue / 10
    
    if dict[part1] != nil {
        dict[part1] = dict[part1]! + 1
    }
    if dict[part2] != nil {
        dict[part2] = dict[part2]! + 1
    }
    
    let secondValue = part1 + part2
    
    part1 = secondValue % 10
    part2 = secondValue / 10
    
    if dict[part1] != nil {
        dict[part1] = dict[part1]! + 1
    }
    if dict[part2] != nil {
        dict[part2] = dict[part2]! + 1
    }
    
    let num = (arrayOfInt[0] == 0) ? arrayOfInt[1] : arrayOfInt[0]
    let theirdValue = firstValue - 2 * num
    
    part1 = theirdValue % 10
    part2 = theirdValue / 10
    
    if dict[part1] != nil {
        dict[part1] = dict[part1]! + 1
    }
    if dict[part2] != nil {
        dict[part2] = dict[part2]! + 1
    }
    
    
    let fourthValue = part1 + part2
    part1 = fourthValue % 10
    part2 = fourthValue / 10
    
    if dict[part1] != nil {
        dict[part1] = dict[part1]! + 1
    }
    if dict[part2] != nil {
        dict[part2] = dict[part2]! + 1
    }
    
    let arr = dict.sorted{$0.0 < $1.0}
    return arr
}


func createSquare(array: [(key: Int, value: Int)])->[(key: Int, value: String)] {
    let strArray = array.map{(key: $0.key, value: ($0.value == 0) ? "---": "\(String(repeating: "\($0.key)", count: $0.value))")}
    return strArray
}
