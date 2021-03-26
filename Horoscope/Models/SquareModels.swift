//
//  SquareModels.swift
//  Horoscope
//
//  Created by Никита Фролов  on 25.02.2021.
//

import Foundation

let COUNT_OF_NUMBERS = 9

struct UserSquare {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
}

struct SquareData: Hashable, Codable {
    var number: Int
    var power: [Power]
    
    struct Power:  Hashable, Codable  {
        var quantity: Int
        var text: String
        var addition: String?
    }
}


struct TextSquare {
    var number: Int
    var count: Int
    var text: String
    var addition: String
}

let dictOfNumbersText: Dictionary<String, Int> = [
    "123": 0,
    "456": 0,
    "789": 0,
    "147": 0,
    "258": 0,
    "369": 0,
    "159": 0,
    "357": 0
]

func createSubTextDict(arraySquare: [(key: Int, value: Int)])->Dictionary<String, Int> {
    var newDict = dictOfNumbersText
    for elem in arraySquare {
        if elem.key == 1 {
            newDict["123"]! += elem.value
            newDict["147"]! += elem.value
            newDict["159"]! += elem.value
        } else if elem.key == 2 {
            newDict["123"]! += elem.value
            newDict["258"]! += elem.value
        } else if elem.key == 3 {
            newDict["123"]! += elem.value
            newDict["369"]! += elem.value
            newDict["357"]! += elem.value
        } else if elem.key == 4 {
            newDict["456"]! += elem.value
            newDict["147"]! += elem.value
        } else if elem.key == 5 {
            newDict["456"]! += elem.value
            newDict["258"]! += elem.value
            newDict["159"]! += elem.value
            newDict["357"]! += elem.value
        } else if elem.key == 6 {
            newDict["456"]! += elem.value
            newDict["369"]! += elem.value
        } else if elem.key == 7 {
            newDict["789"]! += elem.value
            newDict["147"]! += elem.value
            newDict["357"]! += elem.value
        } else if elem.key == 8 {
            newDict["789"]! += elem.value
            newDict["258"]! += elem.value
        } else if elem.key == 9 {
            newDict["789"]! += elem.value
            newDict["369"]! += elem.value
            newDict["159"]! += elem.value
        }
    }
    
    return newDict
}

func decodeSquare(arraySquare: [(key: Int, value: Int)], text: [SquareData])->[TextSquare] {
    var result = [TextSquare]()
    for i in 0..<COUNT_OF_NUMBERS {
        for elem in text[i].power {
            if elem.quantity == arraySquare[i].value && text[i].number == arraySquare[i].key {
                result.append(TextSquare(number: text[i].number,count: elem.quantity, text: elem.text, addition: elem.addition!))
            }
        }
    }
    let newDict = createSubTextDict(arraySquare: arraySquare)
    for i in COUNT_OF_NUMBERS..<text.count {
        let str = String(text[i].number)
        if (newDict[str] != nil) {
            let resultNumber = (newDict[str]! <= 6 ? newDict[str]! : 6)
            result.append(TextSquare(number: text[i].number, count: resultNumber, text: text[i].power[resultNumber].text, addition: ""))
        }
    }
    return result
}
