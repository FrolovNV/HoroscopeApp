//
//  DateHeader.swift
//  Horoscope
//
//  Created by Никита Фролов  on 18.02.2021.
//

import SwiftUI

struct DateHeader: View {
    
    @Binding var date: Date
    @State var showingDataPicker = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Text("\(findMonth(date: date))")
                .font(.custom("Jost-Bold", size: 20))
            Spacer()
            Button(action: {
                showingDataPicker.toggle()
            }, label: {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            })
        }
        .padding()
        .sheet(isPresented: $showingDataPicker) {
            ProfileView(date: $date, show: self.$showingDataPicker)
        }
    }
}

struct DateHeader_Previews: PreviewProvider {
    static var previews: some View {
        DateHeader(date: .constant(Date()))
            .environmentObject(UserDate())
    }
}
