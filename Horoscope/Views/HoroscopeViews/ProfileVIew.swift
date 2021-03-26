//
//  ProfileVIew.swift
//  Horoscope
//
//  Created by Никита Фролов  on 19.02.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var date: Date
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Ваш день рождения")
                    .font(.custom("Jost-Bold", size: 25))
                DatePicker("Дата рождения", selection: $date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .environment(\.locale, Locale(identifier: "ru_RU"))
                    .padding()
            }
            .navigationBarTitle(Text("Настройки"), displayMode: .inline)
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    UserDefaults.standard.set(fromDateToString(date: date), forKey: UserDefNaming.day)
                    self.show = false
                }, label: {
                    Text("Готово")
                        .bold()
                        .foregroundColor(.blue)
                })
            })
        }
        
    }
}
