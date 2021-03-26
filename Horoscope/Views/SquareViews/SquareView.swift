//
//  SquareView.swift
//  Horoscope
//
//  Created by Никита Фролов  on 18.02.2021.
//

import SwiftUI

struct SquareView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var user: UserDate
    
    @State var arrayOfNumbers: [(key: Int, value: String)]
    @State var arrayOfDecodeText: [TextSquare]
    
    @State var flags = [false, false, false, false, false, false, false, false, false]
    
    private let arrayOfNaming = [
        ["характер, сила воли", "здоровье, красота", "удача, везение"],
        ["энергетика, харизма", "логика, интуиция", "чувство долга"],
        ["познание, творчество", "трудолюбие, мастерство", "память, ум"]
    ]
    
    private let arrayOfTitles = [
        "Характер, Сила Воли",
        "Энергетика, Харизма",
        "Познание, Творчество",
        "Здоровье, Красота",
        "Логика, Интуиция",
        "Трудолюбие, Мастерство",
        "Удача, Везение",
        "Чувство Долга",
        "Память, Ум"
    ]
    
    private let subTitles = [
        "Самооценка",
        "Зарабатывание денег",
        "Талант",
        "Целеустремленность",
        "Семейность",
        "Стабильность",
        "Духовный потенциал",
        "Темперамент"
    ]
    
    
    
    init(user: UserDate) {
        let items = calculateSquare(dateOfBirth: user.date)
        self._arrayOfNumbers = State(initialValue: createSquare(array: items))
        self._arrayOfDecodeText = State(initialValue: decodeSquare(arraySquare: items, text: user.squareData))
        self.user = user
    }
    
    var body: some View {
        VStack {
            DateHeader(date: $user.date)
            ScrollView {
                //Grid with numbers
                ScrollViewReader { proxy in
                    VStack(spacing: 2) {
                        ForEach(0..<3) { i in
                            HStack(spacing: 2) {
                                ForEach(0..<3) { j in
                                    Button(action: {
                                        withAnimation(.easeIn) {
                                            proxy.scrollTo(i + j * 3, anchor: .top)
                                        }
                                    }, label:{
                                        RectangleOfSquare(number: arrayOfNumbers[i + j * 3].value, title: arrayOfNaming[i][j])
                                    })
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    
                    //Text
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(0..<arrayOfTitles.count) { i in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(arrayOfTitles[i]) - ")
                                        .font(.custom("Jost-Bold", size: 22))
                                    +
                                    Text("\(arrayOfDecodeText[i].count == 0 ? "Нет цифр" : String(repeating: "\(arrayOfDecodeText[i].number)", count: arrayOfDecodeText[i].count))")
                                        .foregroundColor(Color.init("Fried"))
                                        .font(.custom("Jost-Bold", size: 22))
                                }
                                .fixedSize(horizontal: false, vertical: true)
                                .id(i)

                                Text("\(arrayOfDecodeText[i].text)")
                                    .font(.custom("Jost-Light", size: 18))
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                    .fixedSize(horizontal: false, vertical: true)
                                if flags[i] {
                                    Text("\(arrayOfDecodeText[i].addition)")
                                        .font(.custom("Jost-Light", size: 18))
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        self.flags[i].toggle()
                                    }
                                }, label: {
                                    HStack {
                                        Text((flags[i]) ? "Скрыть": "Подробнее")
                                            .font(.custom("Jost-Light", size: 18))
                                        Image(systemName: "chevron.right")
                                            .imageScale(.small)
                                            .rotationEffect(.degrees(flags[i] ? 270 : 0))
                                    }
                                })
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            }
                        }
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(COUNT_OF_NUMBERS..<arrayOfDecodeText.count) { i in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(subTitles[i - COUNT_OF_NUMBERS]) - ")
                                    .font(.custom("Jost-Bold", size: 22))
                                +
                                Text("\(arrayOfDecodeText[i].count)")
                                    .font(.custom("Jost-Bold", size: 22))
                                    .foregroundColor(Color.init("Fried"))
                            }
                            .fixedSize(horizontal: false, vertical: true)
                            Text("Квадраты - \(arrayOfDecodeText[i].number)")
                                .font(.custom("Jost-Light", size: 16))
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            Text("\(arrayOfDecodeText[i].text)")
                                .font(.custom("Jost-Light", size: 18))
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    }
                }
                .padding(.bottom, 15)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
        }
        .onReceive(user.$date, perform: { date in
            let items = calculateSquare(dateOfBirth: date)
            self.arrayOfNumbers = createSquare(array: items)
            self.arrayOfDecodeText = decodeSquare(arraySquare: items, text: user.squareData)
            self.flags = [false, false, false, false, false, false, false, false, false]
        })
        
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(user: UserDate())
    }
}
