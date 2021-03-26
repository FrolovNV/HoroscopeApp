//
//  Auth.swift
//  Horoscope
//
//  Created by Никита Фролов  on 22.02.2021.
//

import SwiftUI

struct Auth: View {
    
    @State var date: Date = Date()
    @Binding var flag: Bool
    
    
    var body: some View {
        VStack {
            Text("Введите дату рождения")
                .font(.custom("Jost-Bold", size: 25))
            
            DatePicker("", selection: $date, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(GraphicalDatePickerStyle())
                .environment(\.locale, Locale(identifier: "ru_RU"))
            
            Button(action: {
                UserDefaults.standard.setValue(fromDateToString(date: date), forKey: UserDefNaming.day)
                self.flag.toggle()
            }, label: {
                Text("Далее")
                    .font(.custom("Jost-Bold", size: 20))
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 300, height: 50)
                    )
                    .padding()
            })
        }
    }
}

struct Auth_Previews: PreviewProvider {
    static var previews: some View {
        Auth(flag: .constant(true))
    }
}
