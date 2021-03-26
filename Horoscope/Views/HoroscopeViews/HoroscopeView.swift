//
//  HoroscopeView.swift
//  Horoscope
//
//  Created by Никита Фролов  on 16.02.2021.
//

import SwiftUI

struct HoroscopeView: View {
    @ObservedObject var user: UserDate
    
    @State var userSign: String
    @State var dateRange: String
    @State var userInfo: [String]?
    @State var titles: [String]
    
    init(user: UserDate) {
        self.user = user
        let date = user.date
        let sign = findSign(date: date)
        self._userSign = State(initialValue: sign)
        self._dateRange = State(initialValue: findDateForSign(name: sign))
        self._userInfo = State(initialValue: findHoroscope(dateOfBith: date, data: user.horoscopeUser))
        let ruSign = findSign(name: sign)
        self._titles = State(initialValue: [
            "Общее",
            "Мужчина - \(ruSign)",
            "Девушка - \(ruSign)",
            "Дополнительно",
            "Любовь и совместимость",
            "Работа и Карьера",
            "Здоровье и Болезни",
            "Судьба и Удача",
            "Советы"
        ])
    }
    
    var body: some View {
        VStack() {
            DateHeader(date: $user.date)
            ScrollView {
                HeaderHoroscope(imageName: userSign, date: dateRange)
                    .padding(.bottom, 10)
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<userInfo!.count) { index in
                        VStack(alignment: .leading) {
                            Text(titles[index])
                                .font(.custom("Jost-Bold", size: 20))
                            Text(userInfo![index])
                                .font(.custom("Jost-Light", size: 18))
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                        }
                    }
                    .padding(.bottom, 10)
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
            }
        }
        .onReceive(user.$date, perform: { date in
            let newSign = findSign(date: date)
            if newSign != self.userSign {
                self.userSign = newSign
                let ruSign = findSign(name: newSign)
                self.titles = [
                    "Общее",
                    "Мужчина - \(ruSign)",
                    "Девушка - \(ruSign)",
                    "Дополнительно",
                    "Любовь и совместимость",
                    "Работа и Карьера",
                    "Здоровье и Болезни",
                    "Судьба и Удача",
                    "Советы"
                ]
            }
            self.userInfo = findHoroscope(dateOfBith: date, data: self.user.horoscopeUser)
        })
        .navigationBarHidden(true)
    }
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView(user: UserDate())
    }
}
